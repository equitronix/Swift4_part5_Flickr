//
//  PhotosDataSource.swift
//  Swift4_Part5_Flickr
//
//  Created by Admin on 25/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class PhotoDataSource : NSObject, UICollectionViewDataSource {
    var photos = [Photo]();
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PhotoCollectionViewCell";
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell;
    }
    
    
}
