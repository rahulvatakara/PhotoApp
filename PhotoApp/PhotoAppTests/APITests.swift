//
//  APITests.swift
//  PhotoAppTests
//
//  Created by Rahul CK on 16/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import XCTest
@testable import PhotoApp


class APITests: XCTestCase {
    
    var apiManager: APIManager!
    var expectation: XCTestExpectation!

    override func setUp() {
        apiManager = APIManager()
        expectation = XCTestExpectation(description: "API Testing")
    }
    
    func testFetchPhotosApi() {
        apiManager.fetchHomeData { (response) in
            switch response {
            case let .failure(error):
                print(error.localizedDescription)
                XCTAssert(false, "Home API Failed: \(error.localizedDescription)")
                break
                
            case let .success(photoItems):
                
                print("\(photoItems?.count ?? 0) photos found")
                self.expectation.fulfill()
                XCTAssert(true)
                break
            }
        }
        wait(for: [expectation], timeout: 200.0)
    }

    override func tearDown() {
        apiManager = nil
        expectation = nil
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
