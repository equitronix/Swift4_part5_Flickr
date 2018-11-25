//
//  PhotoStore.swift
//  Swift4_Part5_Flickr
//
//  Created by Admin on 24/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

enum ImageResult{
    case success(UIImage)
    case failure(Error)
}

enum PhotoError: Error{
    case imageCreationError;
}

enum PhotosResult{
    case success([Photo])
    case failure(Error)
}
class PhotoStore{
    private let session : URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchPhotos(completion: @escaping (PhotosResult) -> Void) {
        let url = FlickrAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            if let jsonData = data {
                OperationQueue.main.addOperation {
                    completion(FlickrAPI.photos(fromData: jsonData))
                }
            }else{
                completion(.failure(error!))
            }
        }
        task.resume()
    }
    func fetchPhoto(photo: Photo, completion: @escaping (ImageResult)->Void){
        let request = URLRequest(url: photo.remoteURL)
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            if let imageData = data {
                let image = UIImage(data: imageData)
                if let image = image {
                    OperationQueue.main.addOperation {
                        completion(.success(image))
                    }
                }else{
                    completion(.failure(PhotoError.imageCreationError))
                }
            }else{
                completion(.failure(error!))
            }
        }
        task.resume();
        
    }
    
}
