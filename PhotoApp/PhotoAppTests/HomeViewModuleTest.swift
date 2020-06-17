//
//  HomeViewModuleTest.swift
//  PhotoAppTests
//
//  Created by Rahul CK on 17/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import XCTest
@testable import PhotoApp

class HomeViewModuleTest: XCTestCase {
    
    var homeView: HomeViewController!
    var expectation: XCTestExpectation!

    
    override func setUp() {
        expectation = XCTestExpectation(description: "Home Module Testing")
    }
    
    override func tearDown() {
        homeView = nil
    }
    
    func testHomeViewPresenterNotNill() {
        homeView = HomeViewController()
        HomeViewRouter.createHomeViewModule(homeviewRef: homeView)
        XCTAssertNotNil(homeView.presentor, "HomeViewPresentor is Nill")
    }
    
    func testHomeViewInteractorNotNill() {
        homeView = HomeViewController()
        HomeViewRouter.createHomeViewModule(homeviewRef: homeView)
        XCTAssertNotNil(homeView.presentor.interactor, "HomeViewInteracter is Nill")
    }
    
    func testHomeViewRouterNotNill() {
        homeView = HomeViewController()
        HomeViewRouter.createHomeViewModule(homeviewRef: homeView)
        XCTAssertNotNil(homeView.presentor.router, "HomeViewRouter is Nill")
    }
    
   
    func testHomeViewInteractorOutputNotNill() {
        let presentor = HomeViewPresentorMockForInterator(expectation: expectation) { (photos, error) -> DarwinBoolean in
            return DarwinBoolean(booleanLiteral: photos != nil)
        }
        let interactor = HomeViewInteractor(presenter: presentor)
        interactor.fetchPhotos()
        wait(for:  [expectation], timeout: 30, enforceOrder: true)
    }
    
    func testHomeViewInteractorOutputNotEmpty() {
        let presentor = HomeViewPresentorMockForInterator(expectation: expectation) { (photos, error) -> DarwinBoolean in
            return DarwinBoolean(booleanLiteral: photos?.isEmpty == false)
        }
        let interactor = HomeViewInteractor(presenter: presentor)
        interactor.fetchPhotos()
        wait(for:  [expectation], timeout: 30, enforceOrder: true)
    }
}

class HomeViewPresentorMockForInterator: HomeViewOutputInteractorProtocol {
    
    var expectation: XCTestExpectation
    var completion: ((_ photos:[PhotoItem]?, _ error: Error?) -> DarwinBoolean)

    
    init(expectation: XCTestExpectation, completion:@escaping ((_ photos:[PhotoItem]?, _ error: Error?) -> DarwinBoolean)) {
        self.expectation = expectation
        self.completion = completion
    }
    
    func photosDidFetch(photos: [PhotoItem]?) {
        let result = completion(photos, nil).boolValue
        XCTAssert(result, "Photo fetching success")
        expectation.fulfill()
    }
    
    func photosDidFetchFailed(error: Error?) {
        XCTAssert(false, error?.localizedDescription ?? "photosDidFetchFailed")
        expectation.fulfill()
    }
    
}
