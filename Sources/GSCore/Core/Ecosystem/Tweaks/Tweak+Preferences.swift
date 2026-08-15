//
//  Tweak+Preferences.swift
//  GSCore
//
//  Created by Noah Little on 12/5/2023.
//

import Foundation

public extension AndroBar {
    typealias Key = KeyEnum

    enum KeyEnum: String {
        case barHeight
    }
    
    var barHeight: Double {
        prefsDict[Key.barHeight.rawValue] as? CGFloat ?? 40.0
    }
}

public extension DualClock {
    typealias Key = KeyEnum
    
    enum KeyEnum: String {
        case primaryTimeZoneID
        case isEnabledCustomTimeZonePrimary
        case primaryName
        case secondaryTimeZoneID
        case isEnabledCustomTimeZoneSecondary
        case secondaryName
    }
    
    var primaryTimeZoneID: String {
        prefsDict[Key.primaryTimeZoneID.rawValue] as? String ?? TimeZone.current.identifier
    }
    
    var isEnabledCustomTimeZonePrimary: Bool {
        prefsDict[Key.isEnabledCustomTimeZonePrimary.rawValue] as? Bool ?? false
    }
    
    var primaryName: String {
        prefsDict[Key.primaryName.rawValue] as? String ?? ""
    }
    
    var secondaryTimeZoneID: String {
        prefsDict[Key.secondaryTimeZoneID.rawValue] as? String ?? TimeZone.current.identifier
    }
    
    var isEnabledCustomTimeZoneSecondary: Bool {
        prefsDict[Key.isEnabledCustomTimeZoneSecondary.rawValue] as? Bool ?? true
    }
    
    var secondaryName: String {
        prefsDict[Key.secondaryName.rawValue] as? String ?? ""
    }
}
