//
//  ItemStore.swift
//  Swift4_Part4_TableView
//
//  Created by Admin on 11/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class ImageStore{
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(forImage image: UIImage, forKey key: String){
        cache.setObject(image, forKey: key as NSString)
        
        let url = imageURL(forKey: key);
        
        if let data = image.pngData() //jpegData(compressionQuality: 0.5)
        {
            try? data.write(to: url, options: .atomic);
        }
    }
    func getImage(forKey key: String) -> UIImage?{
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage;
        }
        let url = imageURL(forKey: key);
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else { return nil;}
        
        cache.setObject(imageFromDisk, forKey: key as NSString);
        return imageFromDisk;
        
        
    }
    func deleteImage(forKey key: String){
        cache.removeObject(forKey: key as NSString)
        let url = imageURL(forKey: key);
        do {
            try FileManager.default.removeItem(at: url);
        }catch {
            print("could not save image to disk \(error)");
        }
    }
    
    func imageURL(forKey key: String) ->URL{
        let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent(key);
    }
}
