//
//  TweakDescriptor.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

// MARK: - Declaration

public protocol TweakDescriptor {
    var tweak: Ecosystem.Tweak { get }
}

public protocol TweakProperties {
    associatedtype KeyEnum: RawRepresentable where KeyEnum.RawValue: StringProtocol
}

// MARK: - Internal

internal extension TweakDescriptor {
    var prefsDict: [String: AnyHashable] {
        prefsURL.plistDict()
    }
}

// MARK: - Public

public extension TweakDescriptor {
    var isInstalledAndEnabled: Bool {
        Ecosystem.isInstalled(tweak: tweak) && isEnabled
    }
}

// MARK: - Private

private extension TweakDescriptor {
    var isEnabled: Bool {
        prefsDict["isEnabled"] as? Bool ?? true
    }
    
    var prefsURL: URL {
        if #available(iOS 16, *) {
            return .init(filePath: tweak.prefsPath)
        } else {
            return .init(fileURLWithPath: tweak.prefsPath)
        }
    }
}
