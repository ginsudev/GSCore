//
//  SegmentedImagePicker.ViewModel.swift
//  GSCore
//
//  Created by Noah Little on 7/4/2023.
//

import Foundation

public extension SegmentedImagePicker {
    struct ViewModel: Identifiable {
        let imagePath: String
        let title: String
        public var id: String { imagePath + title }
        
        public init(imagePath: String, title: String) {
            self.imagePath = imagePath
            self.title = title
        }
    }
}
