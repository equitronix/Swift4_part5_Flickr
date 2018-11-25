//
//  ViewController.swift
//  Swift4_Part5_Flickr
//
//  Created by Admin on 24/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var store: PhotoStore!
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchPhotos{
            (result) -> Void in
            switch result {
            case let .success(photos):
                print("successfully loaded \(photos.count)");
                if let firstPhoto = photos.first {
                    self.store.fetchPhoto(photo: firstPhoto, completion: { (imageResult) in
                        switch imageResult {
                        case let .success(photoImage):
                            self.imageView.image = photoImage;
                        case let .failure(error):
                            print("image creatoipn failed \(error)")
                        }
                    })
                }
            case let .failure(error):
                print("could not load error \(error)")
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

