//
//  PhotoDetailViewProtocol.swift
//  PhotoApp
//
//  Created by Rahul CK on 16/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit

protocol PhotoDetailViewProtocol: class {
    // PRESENTER -> VIEW
    func showPhotoDetail(with photo: PhotoItem)
    func showAPIError(message:String)
}

protocol PhotoDetailViewPresenterProtocol: class {
    //View -> Presenter
    var interactor: PhotoDetailViewInputInteractorProtocol? {get set}
    var view: PhotoDetailViewProtocol? {get set}
    var router: PhotoDetailViewRouterProtocol? {get set}
    func viewDidLoad()
    func backButtonAction(controller: UIViewController)

}

protocol PhotoDetailViewInputInteractorProtocol: class {
    var presenter: PhotoDetailViewOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func fetchPhotoDetail(photo:PhotoItem)
}

protocol PhotoDetailViewOutputInteractorProtocol: class {
    //Interactor -> Presenter
   
}

protocol PhotoDetailViewRouterProtocol: class {
    //Presenter -> Router
    static func createPhotoDetailViewModule(photoDetailViewRef: PhotoDetailViewController,with photo: PhotoItem)
    func popToPhotos(view: UIViewController)

}
