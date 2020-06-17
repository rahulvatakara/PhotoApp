//
//  APIManager.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import Foundation

class APIManager: BaseAPIManager {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    /**
     Fetch home data, photos
     */
    func fetchHomeData(completion: @escaping (APIResponse<[PhotoItem]?, APIError>) -> Void) {
        
        let endpoint = AppFeed.home
        var request = endpoint.request
        request.method = HTTPMethod.get
        fetch(with: request, decode: { json -> [PhotoItem]? in
            guard let photoFeedResult = json as? [PhotoItem] else { return  nil }
            return photoFeedResult
        }, completion: completion)
    }
}
