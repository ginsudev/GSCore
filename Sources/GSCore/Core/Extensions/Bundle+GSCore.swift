//
//  Bundle+GSCore.swift
//  GSCore
//
//  Created by Noah Little on 26/3/2023.
//

import Foundation

extension Bundle {
    
    static var gsCore: Bundle {
        Bundle(path: Directory.bundle)!
    }
}
