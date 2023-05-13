//
//  Ecosystem.swift
//  GSCore
//
//  Created by Noah Little on 19/3/2023.
//

import Foundation

// MARK: - Public

public struct Ecosystem {
    public enum JailbreakType: String {
        case rootless = "/var/jb/"
        case root = "/"
    }
    
    public static var jailbreakType: JailbreakType {
        #if ROOTLESS
        return .rootless
        #else
        return .root
        #endif
    }
    
    public static func isInstalled(tweak: Tweak) -> Bool {
        FileManager.default.fileExists(atPath: tweak.dylibPath)
    }
}
