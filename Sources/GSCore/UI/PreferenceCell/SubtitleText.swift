//
//  SubtitleText.swift
//  GSCore
//
//  Created by Noah Little on 6/4/2023.
//

import SwiftUI

public struct SubtitleText: View {
    let title: String
    let subtitle: String?
    let titleFont: Font
    let subtitleFont: Font
    
    public init(
        title: String,
        subtitle: String?,
        titleFont: Font = .body,
        subtitleFont: Font = .caption
    ) {
        self.title = title
        self.subtitle = subtitle
        self.titleFont = titleFont
        self.subtitleFont = subtitleFont
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(titleFont)
                .foregroundColor(.primary)
            if let subtitle {
                Text(subtitle)
                    .font(subtitleFont)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 5)
        .multilineTextAlignment(.leading)
    }
}

struct SubtitleText_Previews: PreviewProvider {
    static var previews: some View {
        SubtitleText(title: "Some title", subtitle: "A subtitle for the title")
    }
}
