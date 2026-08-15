//
//  Directory.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

internal enum Directory {
    static let tweaks = "/Library/MobileSubstrate/DynamicLibraries".rootify
    static let prefs = "/var/mobile/Library/Preferences".rootify
    static let framework = "/Library/Frameworks/GSCore.framework".rootify
    static let bundle = "/Library/Frameworks/GSCore.framework/Bundle.bundle".rootify
}
