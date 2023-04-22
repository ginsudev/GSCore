//
//  DetailedSlider.swift
//  GSCore
//
//  Created by Noah Little on 6/4/2023.
//

import SwiftUI

public struct DetailedSlider: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    let title: String
    
    public init(
        value: Binding<Double>,
        range: ClosedRange<Double>,
        title: String
    ) {
        self._value = value
        self.range = range
        self.title = title
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(title)
                Spacer()
                Text(String(format: "%.1f", value))
                    .foregroundColor(.secondary)
            }
            Slider(
                value: $value,
                in: range
            ) {
                Text(title)
            } minimumValueLabel: {
                Text(String(format: "%.1f", range.lowerBound))
            } maximumValueLabel: {
                Text(String(format: "%.1f", range.upperBound))
            }
            .foregroundColor(.secondary)
        }
        .padding(.vertical, 5)
    }
}

struct DetailedSlider_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            DetailedSlider(
                value: .constant(80),
                range: 0...1000,
                title: "Notification vertical offset"
            )
        }
    }
}
