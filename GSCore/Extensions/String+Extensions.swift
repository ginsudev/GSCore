//
//  String+Rootless.swift
//  GSCore
//
//  Created by Noah Little on 19/3/2023.
//

import Foundation

public extension String {
    var rootify: Self {
        guard first == "/" else { return self }

        #if ROOTLESS
        return "/var/jb/" + self.dropFirst()
        #else
        return self
        #endif
    }
    
    func localize(bundle: Bundle) -> Self {
        String(NSLocalizedString(self, bundle: bundle, comment: ""))
    }
}

internal extension String {
    var localized: Self {
        localize(bundle: .gsCore)
    }
}
