//
//  HeaderViewButton.swift
//  
//
//  Created by Noah Little on 18/3/2023.
//

import SwiftUI

public struct HeaderViewButton: View {
    private let title: String?
    private let icon: Image?
    private let isVisibleBorder: Bool
    private let onDidTap: (() -> Void)?
    
    public init(
        title: String?,
        icon: Image? = nil,
        isVisibleBorder: Bool = false,
        onDidTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.icon = icon
        self.isVisibleBorder = isVisibleBorder
        self.onDidTap = onDidTap
    }
    
    public var body: some View {
        if let onDidTap {
            Button {
                onDidTap()
            } label: {
                content
            }
        } else {
            content
        }
    }
    
    private var content: some View {
        ZStack {
            if isVisibleBorder {
                RoundedRectangle(cornerRadius: 5)
                    .stroke()
            }
            HStack {
                if let icon {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
                
                if let title {
                    Text(title)
                        .font(.caption)
                }
            }
            .padding(.vertical, 6.0)
            .padding(.horizontal, 12.0)
        }
        .fixedSize()
    }
}
