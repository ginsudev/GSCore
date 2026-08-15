//
//  DetailedNavigationLink.swift
//  GSCore
//
//  Created by Noah Little on 26/3/2023.
//

import SwiftUI

// MARK: - Public

public protocol DetailedLinkDisplayable {
    var cell: PreferenceCell.Cell { get }
}

extension DetailedLinkDisplayable {
    var id: String { cell.id }
}

public struct DetailedNavigationLink<Destination: View>: View, DetailedLinkDisplayable {
    public let cell: PreferenceCell.Cell
    private let destination: Destination

    public init(
        cell: PreferenceCell.Cell,
        @ViewBuilder destination: @escaping () -> Destination
    ) {
        self.cell = cell
        self.destination = destination()
    }
    
    public var body: some View {
        NavigationLink {
            destination
        } label: {
            PreferenceCell(cell: cell)
        }
    }
}
