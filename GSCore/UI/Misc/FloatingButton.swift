//
//  FloatingButton.swift
//  GSCore
//
//  Created by Noah Little on 6/4/2023.
//

import SwiftUI

public extension View {
    func floatingMenuButton<Buttons: View>(
        title: String,
        @ViewBuilder buttons: @escaping () -> Buttons
    ) -> some View {
        modifier(FloatingButtonModifier(title: title, buttons: buttons))
    }
}

private struct FloatingButtonModifier<Buttons: View>: ViewModifier {
    private let title: String
    @ViewBuilder private let buttons: () -> Buttons

    private let textColor: Color = .white
    
    init(
        title: String,
        @ViewBuilder buttons: @escaping () -> Buttons
    ) {
        self.title = title
        self.buttons = buttons
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                Menu(content: buttons) {
                    Text(title)
                        .foregroundColor(textColor)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 26)
                        .background(
                            Capsule()
                                .fill(Colors.tint)
                                .shadow(radius: 5)
                        )
                }
            }
        }
    }
}
