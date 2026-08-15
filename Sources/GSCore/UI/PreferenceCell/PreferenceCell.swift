//
//  PreferenceCell.swift
//  GSCore
//
//  Created by Noah Little on 7/4/2023.
//

import SwiftUI

// MARK: - Public

public struct PreferenceCell: View {
    @Environment(\.colorScheme) var colorScheme
    
    let imageName: String?
    let isAnimatedImage: Bool
    let title: String
    let subtitle: String?
    let accessibility: AccessibilityViewType
    
    @State private var isPresentedAlert = false
    @State private var isAnimating = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 10.0)
            .repeatForever(autoreverses: false)
    }
    
    public init(cell: Cell) {
        self.init(
            imageName: cell.imageName,
            isAnimatedImage: cell.isAnimated,
            title: cell.title,
            subtitle: cell.subtitle,
            accessibility: cell.accessibility
        )
    }
    
    public init(
        imageName: String? = nil,
        isAnimatedImage: Bool = false,
        title: String,
        subtitle: String? = nil,
        accessibility: AccessibilityViewType = .none
    ) {
        self.imageName = imageName
        self.isAnimatedImage = isAnimatedImage
        self.title = title
        self.subtitle = subtitle
        self.accessibility = accessibility
    }
    
    public var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 16.0) {
                imageView
                textView
                Spacer()
            }
            Spacer(minLength: 35.0)
            accessibilityView
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(background)
    }
}

// MARK: - Private

private extension PreferenceCell {
    @ViewBuilder
    var imageView: some View {
        if let imageName {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(Colors.tint)
                .rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
                .animation(self.isAnimating ? foreverAnimation : .default)
                .onAppear {
                    guard isAnimatedImage else { return }
                    self.isAnimating = true
                }
                .onDisappear { self.isAnimating = false }
        }
    }
    
    var textView: some View {
        SubtitleText(
            title: title,
            subtitle: subtitle,
            titleFont: .title2,
            subtitleFont: .body
        )
    }
    
    @ViewBuilder
    var accessibilityView: some View {
        switch accessibility {
        case .chevron:
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(.secondary)
        case let .info(title, message):
            Button {
                isPresentedAlert = true
            } label: {
                Image(systemName: "info.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.secondary)
            }
            .alert(isPresented: $isPresentedAlert) {
                Alert(
                    title: Text(title),
                    message: Text(message),
                    dismissButton: .cancel()
                )
            }
        case let .toggle(isEnabled):
            Toggle("", isOn: isEnabled)
                .labelsHidden()
        case .none:
            EmptyView()
        }
    }
    
    var background: some View {
        RoundedRectangle(cornerRadius: 16.0)
            .foregroundColor(
                colorScheme == .dark
                ? Colors.darkCellBackground
                : .white
            )
    }
}

// MARK: - Previews

struct PreferenceCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            PreferenceCell(
                imageName: "house.fill",
                isAnimatedImage: true,
                title: "Home",
                subtitle: "Sweet home",
                accessibility: .toggle(isEnabled: .constant(true))
            )
        }
    }
}
