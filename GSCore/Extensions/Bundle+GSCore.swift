//
//  Bundle+GSCore.swift
//  GSCore
//
//  Created by Noah Little on 26/3/2023.
//

import Foundation

internal extension Bundle {
    static var gsCore: Bundle {
        if let bundle = Bundle(path: Directory.bundle.rawValue.rootify) {
            NSLog("[GSCore]: Bundle loaded at \(Directory.bundle.rawValue.rootify)")
            return bundle
        } else {
            NSLog("[GSCore]: Unable to load bundle at \(Directory.bundle.rawValue.rootify)")
            return .main
        }
    }
}
