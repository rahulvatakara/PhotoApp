//
//  HomeViewPresenter.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit

class HomeViewPresenter:HomeViewPresenterProtocol,HomeViewOutputInteractorProtocol {
    
    var router: HomeViewRouterProtocol?
    var interactor: HomeViewInputInteractorProtocol?
    weak var view: HomeViewProtocol?
    
    func viewDidLoad() {
        interactor?.fetchPhotos()
        
    }
    /**
     This will get called when a photo is selected from a list
     */
    func showPhotoSelection(with photo: PhotoItem, from view: UIViewController) {
        router?.pushToPhotoDetail(from: view, photo: photo)
    }
    /**
     Fetch photos  success call back
     */
    func photosDidFetch(photos: [PhotoItem]?) {
        if let photos = photos {
            self.view?.showPhotos(with: photos)
        }
        else {
            self.view?.showAPIError(message: LocalisationConstants.offlineMessage)
        }
    }
    /**
     Fetch photos  failed call back
     */
    func photosDidFetchFailed(error: Error?) {
        self.view?.showAPIError(message: LocalisationConstants.offlineMessage)
        
    }
    
}
