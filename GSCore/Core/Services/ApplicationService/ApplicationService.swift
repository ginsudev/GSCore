//
//  ApplicationService.swift
//  GSCore
//
//  Created by Noah Little on 18/4/2023.
//

import Foundation

// MARK: - Public

public struct ApplicationService {
    private static let PromptUnlockDeviceKey = "__PromptUnlockDevice"
    private static let UnlockDeviceKey = "__UnlockDevice"
    
    public init() { }
}

// MARK: - Public

public extension ApplicationService {
    enum DefinedApp: String {
        case weather = "com.apple.weather"
        case clock = "com.apple.mobiletimer"
    }
    
    enum App {
        case defined(DefinedApp)
        case custom(String)
    }
    
    func open(app: App) {
        let service = _FBSSystemService.shared()
        
        let launchOptions = [
            Self.PromptUnlockDeviceKey : NSNumber(value: 1),
            Self.UnlockDeviceKey : NSNumber(value: 1)
        ]
        
        let identifier: String = {
            switch app {
            case .defined(let defined):
                return defined.rawValue
            case .custom(let identifier):
                return identifier
            }
        }()

        service.openApplication(
            identifier,
            options: launchOptions
        ) { }
    }
}
