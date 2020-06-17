//
//  APIResponse.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import Foundation

enum APIResponse<T, U> where U: Error  {
    case success(T)
    case failure(U)
}
