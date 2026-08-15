//
//  Copy.swift
//  GSCore
//
//  Created by Noah Little on 6/4/2023.
//

import Foundation

internal enum Copy {
    internal enum Ginsu {
        static var name = "Ginsu"
        static var twitterHandle = "@GinsuDev"
        static var repo = "https://ginsu.dev/repo"
    }
    
    internal enum UI {
        static var copywrite: String {
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            let yearString = dateFormatter.string(from: date)
            return "© 2019 - \(yearString) \(Ginsu.name) (\(Ginsu.twitterHandle))"
        }
        
        static var addRepo = "Add_Repo".localized
        static var appearance = "Appearance".localized
        static var behaviour = "Behaviour".localized
        static var configLooks = "Configure_Looks".localized
        static var configFunctionality = "Configure_Functionality".localized
        static var whatsTheProblem = "What_The_Problem".localized
        static var respring = "Respring".localized
        static var confirm = "Confirm".localized
        static var cancel = "Cancel".localized
        static var enabled = "Enabled".localized
        static var enableDisableTweak = "Enable_Disable_Tweak".localized
        static var applyChanges = "Apply_Changes".localized
    }
}
