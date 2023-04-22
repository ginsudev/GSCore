//
//  UIColor+Extension.swift
//  GSCore
//
//  Created by Noah Little on 23/7/2022.
//

import UIKit

extension UIColor {
    public func suitableForegroundColour() -> UIColor {
        isLight() ? .black : .white
    }
    
    private func isLight() -> Bool {
        let originalCGColor = self.cgColor
        let RGBCGColor = originalCGColor.converted(
            to: CGColorSpaceCreateDeviceRGB(),
            intent: .defaultIntent,
            options: nil
        )!

        guard let components = RGBCGColor.components, components.count >= 3 else {
            return false
        }
        let brightness = Float(((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000)
        return (brightness > 0.7)
    }
}
