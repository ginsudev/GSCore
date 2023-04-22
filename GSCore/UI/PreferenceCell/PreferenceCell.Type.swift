//
//  PreferenceCell.Type.swift
//  GSCore
//
//  Created by Noah Little on 22/4/2023.
//

import SwiftUI

public extension PreferenceCell {
    private typealias UI = Copy.UI
    
    enum AccessibilityViewType {
        case toggle(isEnabled: Binding<Bool>)
        case chevron
        case info(title: String, message: String)
        case none
    }
    
    enum Cell: Identifiable {
        case enabled(isEnabled: Binding<Bool>)
        case respring
        case appearance
        case behaviour
        case custom(title: String, subtitle: String, imageName: String, accessibility: AccessibilityViewType, isAnimated: Bool)
        
        var title: String {
            switch self {
            case .appearance: return UI.appearance
            case .behaviour: return UI.behaviour
            case .enabled: return UI.enabled
            case .respring: return UI.respring
            case let .custom(title, _, _, _, _): return title
            }
        }
        
        var subtitle: String {
            switch self {
            case .appearance: return UI.configLooks
            case .behaviour: return UI.configFunctionality
            case .enabled: return UI.enableDisableTweak
            case .respring: return UI.applyChanges
            case let .custom(_, subtitle, _, _, _): return subtitle
            }
        }
        
        var imageName: String {
            switch self {
            case .appearance: return "paintbrush"
            case .behaviour: return "gear"
            case .enabled: return "power"
            case .respring: return "arrow.triangle.2.circlepath"
            case let .custom(_, _, imageName, _, _): return imageName
            }
        }
        
        var accessibility: AccessibilityViewType {
            switch self {
            case .appearance, .behaviour: return .chevron
            case let .enabled(isEnabled): return .toggle(isEnabled: isEnabled)
            case .respring: return .none
            case let .custom(_, _, _, accessibility, _): return accessibility
            }
        }
        
        var isAnimated: Bool {
            switch self {
            case .appearance, .enabled, .respring: return false
            case .behaviour: return true
            case let .custom(_, _, _, _, isAnimated): return isAnimated
            }
        }
        
        public var id: String { title + subtitle + imageName }
    }
}
