//
//  Ecosystem.swift
//  GSCore
//
//  Created by Noah Little on 19/3/2023.
//

import Foundation

public struct Ecosystem {
    public enum Tweak {
        case androBar
        case dockSearch
    }
    
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
        let dylibName: String = {
            switch tweak {
            case .androBar:
                return AndroBar().dylibName
            case .dockSearch:
                return DockSearch().dylibName
            }
        }()
        
        let path = (Directory.tweaks.rawValue + dylibName).rootify
        guard FileManager.default.fileExists(atPath: path) else { return false }
        return true
    }
}
