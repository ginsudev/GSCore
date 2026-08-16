//
//  UIDevice+Extensions.swift
//  GSCore
//
//  Created by Noah Little on 13/5/2023.
//

import UIKit.UIDevice
@_implementationOnly import GSCoreC

extension UIDevice {
    
    public static var isFaceIDiPhone: Bool {
        !currentIsIPad() && !_hasHomeButton()
    }
}
