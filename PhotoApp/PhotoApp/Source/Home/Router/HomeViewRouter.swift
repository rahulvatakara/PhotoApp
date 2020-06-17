
//
//  HomeViewRouter.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit

class HomeViewRouter: HomeViewRouterProtocol {
    
    /**
     Assemble home module
     */
    static func createHomeViewModule(homeviewRef: HomeViewController) {
        let presenter:HomeViewPresenterProtocol & HomeViewOutputInteractorProtocol = HomeViewPresenter()
        presenter.router = HomeViewRouter()
        presenter.view = homeviewRef
        presenter.interactor = HomeViewInteractor(presenter: presenter)
        homeviewRef.presentor = presenter
    }
    
    /**
     Navigate to Photo Detail
     */
    func pushToPhotoDetail(from view: UIViewController, photo: PhotoItem) {
        let controller = PhotoDetailViewController.instantiateViewController()
        PhotoDetailViewRouter.createPhotoDetailViewModule(photoDetailViewRef: controller, with: photo)
        view.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
