//
//  PhotoDetailModuleTest.swift
//  PhotoAppTests
//
//  Created by Rahul CK on 17/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import XCTest
@testable import PhotoApp

class PhotoDetailModuleTest: XCTestCase {
    
    var photoDetailView: PhotoDetailViewController!


    override func setUp() {
        photoDetailView = PhotoDetailViewController()
    }

    override func tearDown() {
        photoDetailView = nil
    }

     func testHomeViewPresenterNotNill() {
        let photoItem = PhotoItem(filename: "filename", author: "author", id: 100)
        PhotoDetailViewRouter.createPhotoDetailViewModule(photoDetailViewRef: photoDetailView, with: photoItem)
           XCTAssertNotNil(photoDetailView.presentor, "PhotoDetailViewPresentor is Nill")
       }
       
      func testHomeViewRouterNotNill() {
        let photoItem = PhotoItem(filename: "filename", author: "author", id: 100)
        PhotoDetailViewRouter.createPhotoDetailViewModule(photoDetailViewRef: photoDetailView, with: photoItem)
        XCTAssertNotNil(photoDetailView.presentor.router, "PhotoDetailViewRouter is Nill")
       }

}
