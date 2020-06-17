//
//  PhotoCollectionViewCell.swift
//  PhotoApp
//
//  Created by Rahul CK on 16/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(photoItem: PhotoItem) {
        let url = URL(string: "\(ImageFeed.iconUrl)\(photoItem.id)")
        titleLabel.text = photoItem.author
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url,placeholder: UIImage(named: ImageStore.placeHolder), options: [.originalCache(.default)])
        
    }
}
