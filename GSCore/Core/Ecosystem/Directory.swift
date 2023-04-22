//
//  Directory.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

internal enum Directory: String {
    case tweaks = "/Library/MobileSubstrate/DynamicLibraries/"
    case prefs = "/var/mobile/Library/Preferences/"
    case framework = "/Library/Frameworks/GSCore.framework/"
    case bundle = "/Library/Frameworks/GSCore.framework/Bundle.bundle/"
}
