//
//  Photo.swift
//  Swift4_Part5_Flickr
//
//  Created by Admin on 24/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import Foundation
class Photo {
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken : Date
    
    init(title:String, remoteURL:URL, photoID: String, dateTaken: Date){
        self.title = title
        self.remoteURL = remoteURL
        self.photoID = photoID
        self.dateTaken = dateTaken
    }
}
