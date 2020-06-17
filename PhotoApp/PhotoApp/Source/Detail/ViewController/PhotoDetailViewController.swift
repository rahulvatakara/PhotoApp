//
//  PhotoDetailViewController.swift
//  PhotoApp
//
//  Created by Rahul CK on 16/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    
    
    var presentor: PhotoDetailViewPresenterProtocol!
    /**
     Instantiate a controller
     */
    static func instantiateViewController() -> PhotoDetailViewController {
        return UIStoryboard.home().instantiateViewController(withIdentifier:
            PhotoDetailViewController.className) as! PhotoDetailViewController
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        presentor.backButtonAction(controller: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        presentor.viewDidLoad()
    }
    
}

//MARK: PhotoDetailView Protocols

extension PhotoDetailViewController: PhotoDetailViewProtocol {
    
    func showPhotoDetail(with photo: PhotoItem) {
        let url = URL(string: "\(ImageFeed.largeUrl)\(photo.id)")
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url, options: [.originalCache(.default)])
        navigationTitleLabel.text = photo.author
    }
    
    func showAPIError(message: String) {
        
    }
    
    
}

