//
//  PhotoCollectionViewCell.swift
//  Swift4_Part5_Flickr
//
//  Created by Admin on 25/11/18.
//  Copyright © 2018 Equitronix. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    func update(with image: UIImage?){
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        }else{
            spinner.startAnimating()
            imageView.image = nil;
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        update(with: nil);
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        update(with: nil)
    }
}
