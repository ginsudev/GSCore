//
//  SearchableListView.swift
//  GSCore
//
//  Created by Noah Little on 7/5/2023.
//

import SwiftUI

public struct SearchableListView: View {
    @State private var searchQuery = ""

    @Binding var selected: String
    let strings: [String]
    
    public init(selected: Binding<String>, strings: [String]) {
        self._selected = selected
        self.strings = strings
    }
    
    public var body: some View {
        List(visibleEntries, id: \.self) { string in
            Button {
                selected = string
            } label: {
                HStack {
                    Text(string)
                    Spacer()
                    CheckmarkView(isSelected: string == selected)
                }
            }
        }
        .compatSearchable(text: $searchQuery)
    }
    
    private var visibleEntries: [String] {
        guard !searchQuery.isEmpty else { return strings }
        return strings.filter { $0.lowercased().contains(searchQuery.lowercased()) }
    }
}

struct SearchableListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchableListView(selected: .constant("a"), strings: ["a", "b", "c"])
    }
}

private extension View {
    func compatSearchable(text: Binding<String>) -> some View {
        modifier(CompatSearchableViewModifier(text: text))
    }
}

private struct CompatSearchableViewModifier: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            // Use good search bar on iOS >= 15.0
            content
                .searchable(text: $text)
        } else {
            // Use ugly search bar on iOS 14
            VStack {
                TextField("Search", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                content
            }
        }
    }
}
