//
//  PhotoCell.swift
//  testProject
//
//  Created by Георгий Ступаков on 2/15/21.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configure(witn flickr: FlickrModel) {
        flickr.image { image in
            self.photoImageView.image = image
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
}
