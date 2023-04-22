//
//  Tweak.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

// MARK: - Tweaks

public struct AndroBar: TweakDescriptor, TweakProperties {
    let dylibName: String = "AndroBar.dylib"
    let prefsName: String = "com.ginsu.androbar.plist"
    
    public init() { }
}

public struct DockSearch: TweakDescriptor {
    let dylibName: String = "DockSearch.dylib"
    let prefsName: String = "com.ginsu.docksearch.plist"
    
    public init() { }
}

// MARK: - Tweak preferences

extension AndroBar {
    typealias Key = KeyEnum

    enum KeyEnum: String {
        case barHeight = "barHeight"
    }
    
    public var barHeight: Double {
        guard isEnabled,
              Ecosystem.isInstalled(tweak: .androBar)
        else { return 0.0 }
        return prefsDict[Key.barHeight.rawValue] as? CGFloat ?? 0.0
    }
}

