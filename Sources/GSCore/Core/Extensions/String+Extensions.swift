//
//  String+Rootless.swift
//  GSCore
//
//  Created by Noah Little on 19/3/2023.
//

import Foundation
import libroot

extension String {
    
    public var rootify: Self {
        jbRootPath(self)
    }
    
    public func localize(bundle: Bundle) -> Self {
        String(NSLocalizedString(self, bundle: bundle, comment: ""))
    }
}

internal extension String {
    
    var localized: Self {
        localize(bundle: .gsCore)
    }
}
