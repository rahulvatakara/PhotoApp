//
//  HomeViewProtocols.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//
import UIKit

protocol HomeViewProtocol: class {
    // PRESENTER -> VIEW
    func showPhotos(with photos: [PhotoItem])
    func showAPIError(message:String)
}

protocol HomeViewPresenterProtocol: class {
    //View -> Presenter
    var interactor: HomeViewInputInteractorProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var router: HomeViewRouterProtocol? {get set}
    func viewDidLoad()
    func showPhotoSelection(with photo: PhotoItem, from view: UIViewController)
}

protocol HomeViewInputInteractorProtocol: class {
    var presenter: HomeViewOutputInteractorProtocol? {get set}
    //Presenter -> Interactor
    func fetchPhotos()
}

protocol HomeViewOutputInteractorProtocol: class {
    //Interactor -> Presenter
    func photosDidFetch(photos: [PhotoItem]?)
    func photosDidFetchFailed(error: Error?)
}

protocol HomeViewRouterProtocol: class {
    //Presenter -> Router
    func pushToPhotoDetail(from view: UIViewController, photo: PhotoItem)
    static func createHomeViewModule(homeviewRef: HomeViewController)
}
