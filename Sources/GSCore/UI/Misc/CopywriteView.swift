//
//  CopywriteView.swift
//  GSCore
//
//  Created by Noah Little on 6/4/2023.
//

import SwiftUI

public struct CopywriteView: View {
    private typealias UI = Copy.UI
    
    @Environment(\.openURL) var openURL
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 12) {
                Image(systemName: "sparkles")
                    .font(.largeTitle)
                Text(UI.copywrite)
            }
            .foregroundColor(.secondary)

            Button(UI.addRepo) {
                if let url = URL(string: Copy.Ginsu.repo) {
                    openURL(url)
                }
            }
            .foregroundColor(Colors.tint)
            .padding(.vertical, 10)
            .padding(.horizontal, 18)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary)
                    .foregroundColor(.clear)
            )
        }
    }
}

struct CopywriteView_Previews: PreviewProvider {
    static var previews: some View {
        CopywriteView()
    }
}
