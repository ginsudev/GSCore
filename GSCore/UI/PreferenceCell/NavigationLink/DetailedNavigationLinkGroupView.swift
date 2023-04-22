//
//  DetailedNavigationLinkGroupView.swift
//  GSCore
//
//  Created by Noah Little on 26/3/2023.
//

import SwiftUI

public struct DetailedNavigationLinkGroupView<Content: DetailedLinkDisplayable & View>: View {
    @Environment(\.colorScheme) var colorScheme
    let links: [Content]
    
    public init(links: [Content]) {
        self.links = links
    }
    
    public var body: some View {
        VStack {
            ForEach(links, id: \.id) { link in
                link
                if let lastLink = links.last?.id, link.id != lastLink {
                    Divider()
                }
            }
        }
        .background(background)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 16.0)
            .foregroundColor(
                colorScheme == .dark
                ? Colors.darkCellBackground
                : Colors.white
            )
    }
}

struct DetailedNavigationLinkGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red

            DetailedNavigationLinkGroupView(links: [
                DetailedNavigationLink(cell: .appearance) {
                    Color.red
                }
            ])
        }
    }
}
