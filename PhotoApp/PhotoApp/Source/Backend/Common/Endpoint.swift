//
//  EndPoints.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//
import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    
    var apiKey: String {
        return ""
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

enum AppFeed {
    case home
}

extension AppFeed: Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var base: String {
        return "https://picsum.photos"
    }
    
    var path: String {
        switch self {
            
        case .home:
            return "/list/"
        }
    }
}


