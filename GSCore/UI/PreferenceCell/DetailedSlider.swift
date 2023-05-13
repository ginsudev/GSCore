//
//  DetailedSlider.swift
//  GSCore
//
//  Created by Noah Little on 6/4/2023.
//

import SwiftUI

public struct DetailedSlider: View {
    @State
    private var isVisibleTextField = false
    
    @State
    private var customValue: String
    
    @Binding
    var value: Double
    
    let range: ClosedRange<Double>
    let title: String
    
    public init(
        value: Binding<Double>,
        range: ClosedRange<Double>,
        title: String
    ) {
        self._value = value
        self._customValue = .init(wrappedValue: "\(value.wrappedValue)")
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
                Image(systemName: isVisibleTextField
                      ? "keyboard.chevron.compact.down"
                      : "keyboard"
                )
                .onTapGesture {
                    isVisibleTextField.toggle()
                }
            }
            
            if isVisibleTextField {
                textField
            } else {
                slider
            }
        }
        .padding(.vertical, 5)
    }
}

private extension DetailedSlider{
    var slider: some View {
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
    
    var textField: some View {
        Group {
            if #available(iOS 15, *) {
                TextField("\(value)", text: $customValue)
                    .onSubmit {
                        isVisibleTextField = false
                    }
            } else {
                TextField("\(value)", text: $customValue)
            }
        }
        .onChange(of: customValue) { newValue in
            guard let castedValue = Double(newValue),
                  range.contains(castedValue)
            else { return }
            self.value = castedValue
        }
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
