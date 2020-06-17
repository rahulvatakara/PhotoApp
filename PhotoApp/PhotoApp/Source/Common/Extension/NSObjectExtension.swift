
//  NSObjectExtension.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//
import UIKit

extension NSObject {

    class var className: String {
        return String(describing: self)
    }
}
