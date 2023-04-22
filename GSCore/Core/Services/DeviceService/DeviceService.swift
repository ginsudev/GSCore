//
//  DeviceService.swift
//  GSCore
//
//  Created by Noah Little on 22/4/2023.
//

import Foundation

public struct DeviceService {
    public init() { }
}

public extension DeviceService {
    func respring() {
        let action = _SBSRelaunchAction(
            reason: "RestartRenderServer",
            options: .fadeToBlackTransition,
            targetURL: nil
        )
        
        _FBSSystemService.shared().send([action], withResult: nil)
    }
}
