//
//  Ecosystem+Tweak.swift
//  GSCore
//
//  Created by Noah Little on 12/5/2023.
//

import Foundation

public extension Ecosystem {
    enum Tweak {
        case androBar
        case dockSearch
        case dualclock2
        case dodo
        case ramUnderTime
        
        var dylibPath: String {
            (Directory.tweaks.rawValue + dylibName).rootify
        }
        
        var prefsPath: String {
            Directory.prefs.rawValue + prefsName
        }
        
        var dylibName: String {
            switch self {
            case .androBar: return "AndroBar.dylib"
            case .dockSearch: return "DockSearch.dylib"
            case .dualclock2: return "DualClock2.dylib"
            case .dodo: return "Dodo.dylib"
            case .ramUnderTime: return "RAMUnderTime.dylib"
            }
        }
        
        var prefsName: String {
            switch self {
            case .androBar: return "androbar".pref
            case .dockSearch: return "docksearch".pref
            case .dualclock2: return "dualclock2".pref
            case .dodo: return "dodo".pref
            case .ramUnderTime: return "ramundertime".pref
            }
        }
    }
}

fileprivate extension String {
    var pref: Self {
        "com.ginsu." + self + ".plist"
    }
}
