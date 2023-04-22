//
//  CheckmarkView.swift
//  GSCore
//
//  Created by Noah Little on 7/4/2023.
//

import SwiftUI

public struct CheckmarkView: View {
    let isSelected: Bool
    
    public init(isSelected: Bool) {
        self.isSelected = isSelected
    }
    
    public var body: some View {
        if isSelected {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(Colors.tint)
        } else {
            Image(systemName: "circle")
                .foregroundColor(.secondary)
        }
    }
}

struct CheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CheckmarkView(isSelected: true)
            CheckmarkView(isSelected: false)
        }
    }
}
