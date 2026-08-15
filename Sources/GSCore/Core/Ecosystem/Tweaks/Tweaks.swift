//
//  Tweak.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

// MARK: - Tweaks

public struct AndroBar: TweakDescriptor, TweakProperties {
    public var tweak: Ecosystem.Tweak = .androBar
    
    public init() { }
}

public struct DockSearch: TweakDescriptor {
    public var tweak: Ecosystem.Tweak = .dockSearch
    
    public init() { }
}

public struct DualClock: TweakDescriptor, TweakProperties {
    public var tweak: Ecosystem.Tweak = .dualclock2
    
    public init() { }
}

public struct Dodo: TweakDescriptor {
    public var tweak: Ecosystem.Tweak = .dodo
    
    public init() { }
}

public struct RAMUnderTime: TweakDescriptor {
    public var tweak: Ecosystem.Tweak = .ramUnderTime
    
    public init() { }
}
