//
//  URL+Dictionary.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

public extension URL {
    func plistDict() -> [String: AnyHashable] {
        var propertyListFormat: PropertyListSerialization.PropertyListFormat = .xml
        do {
            let data = try Data(contentsOf: self)
            guard let plistDict = try PropertyListSerialization.propertyList(
                from: data,
                options: .mutableContainersAndLeaves,
                format: &propertyListFormat
            ) as? [String : AnyHashable] else { return [String : AnyHashable]() } // Return empty dictionary if plist doesn't exist yet.
            return plistDict
        } catch {
            return [String : AnyHashable]()
        }
    }
}
