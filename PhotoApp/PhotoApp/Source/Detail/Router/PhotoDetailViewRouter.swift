//
//  PhotoDetailViewRouter.swift
//  PhotoApp
//
//  Created by Rahul CK on 16/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit


class PhotoDetailViewRouter:PhotoDetailViewRouterProtocol {

    static func createPhotoDetailViewModule(photoDetailViewRef: PhotoDetailViewController, with photo: PhotoItem) {
        let presenter = PhotoDetailViewPresenter()
        presenter.router = PhotoDetailViewRouter()
        presenter.selectedPhoto = photo
        presenter.view = photoDetailViewRef
        photoDetailViewRef.presentor = presenter
    }
  
    func popToPhotos(view: UIViewController) {
        view.navigationController?.popViewController(animated: true)
    }

    
  
    
    
}
