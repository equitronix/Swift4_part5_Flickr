//
//  ViewController.swift
//  Swift4_Part5_Flickr
//
//  Created by Admin on 24/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = photoDataSource;
        collectionView.delegate = self;
        store.fetchPhotos{
            (result) -> Void in
            switch result {
            case let .success(photos):
                print("successfully loaded \(photos.count)");
                self.photoDataSource.photos = photos;
            case let .failure(error):
                print("could not load error \(error)")
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        
        store.fetchPhoto(photo: photo) { (imageResult) in
            
            guard let photoIndex = self.photoDataSource.photos.index(where: {$0 === photo}),
                case let .success(image) = imageResult else {
                    return;
            }
            let photoIndexPath = IndexPath(item: photoIndex, section: 0);
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell{
                cell.update(with: image);
            }
            
            
        }
        
        
    }
    
}

