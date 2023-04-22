//
//  TweakDescriptor.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

internal protocol TweakDescriptor {
    var dylibName: String { get }
    var prefsName: String { get }
}

internal protocol TweakProperties {
    associatedtype KeyEnum: RawRepresentable where KeyEnum.RawValue: StringProtocol
}

internal extension TweakDescriptor {
    var prefsURL: URL {
        if #available(iOS 16, *) {
            return .init(filePath: Directory.prefs.rawValue + prefsName)
        } else {
            return .init(fileURLWithPath: Directory.prefs.rawValue + prefsName)
        }
    }
    
    var prefsDict: [String: AnyHashable] {
        prefsURL.plistDict()
    }
    
    var isEnabled: Bool {
        prefsDict["isEnabled"] as? Bool ?? false
    }
}
