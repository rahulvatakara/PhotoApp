//
//  PhotoDetailViewPresenter.swift
//  PhotoApp
//
//  Created by Rahul CK on 16/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit

class PhotoDetailViewPresenter: PhotoDetailViewPresenterProtocol,PhotoDetailViewOutputInteractorProtocol {
    
    var interactor: PhotoDetailViewInputInteractorProtocol?
    var view: PhotoDetailViewProtocol?
    var router: PhotoDetailViewRouterProtocol?
    var selectedPhoto:PhotoItem!

    func viewDidLoad() {
        view?.showPhotoDetail(with: selectedPhoto)
    }
    
    func backButtonAction(controller: UIViewController) {
        router?.popToPhotos(view: controller)
      }
   
}
