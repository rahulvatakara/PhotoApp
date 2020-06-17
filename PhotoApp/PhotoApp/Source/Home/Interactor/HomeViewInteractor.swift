
//
//  HomeInteractor.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import Foundation

class HomeViewInteractor: HomeViewInputInteractorProtocol {
    
    weak var presenter: HomeViewOutputInteractorProtocol?
    var apiManager = APIManager()
    
    init(presenter:HomeViewOutputInteractorProtocol) {
        self.presenter = presenter
    }
    
    /**
     Fetch all photos
     */
    func fetchPhotos() {
        apiManager.fetchHomeData { (response) in
            switch response {
            case let .failure(error):
                self.presenter?.photosDidFetchFailed(error: error)
                break
            case let .success(photos):
                self.presenter?.photosDidFetch(photos: photos)
                break
            }
        }
    }
    
    
}
