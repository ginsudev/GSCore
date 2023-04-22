//
//  AlertRespringButton.swift
//  GSCore
//
//  Created by Noah Little on 22/4/2023.
//

import SwiftUI

public struct AlertRespringButton: View {
    private typealias UI = Copy.UI
    
    public init() { }
    
    public var body: some View {
        Menu {
            Button(UI.respring) {
                DeviceService().respring()
            }
        } label: {
            icon
                .imageScale(.large)
        }
    }
    
    @ViewBuilder
    private var icon: some View {
        if #available(iOS 15, *) {
            Image(systemName: "gear.badge.checkmark")
        } else {
            Image(systemName: "checkmark.circle")
        }
    }
}

struct AlertRespringButton_Previews: PreviewProvider {
    static var previews: some View {
        AlertRespringButton()
    }
}
