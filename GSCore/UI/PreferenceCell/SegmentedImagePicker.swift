//
//  SegmentedImagePicker.swift
//  GSCore
//
//  Created by Noah Little on 7/4/2023.
//

import SwiftUI

// MARK: - Public

public struct SegmentedImagePicker: View {
    @Binding var selection: Int
    let viewModels: [ViewModel]
    
    public init(
        selection: Binding<Int>,
        viewModels: [ViewModel]
    ) {
        self._selection = selection
        self.viewModels = viewModels
    }
    
    public var body: some View {
        HStack(spacing: 40) {
            Spacer()
            ForEach(Array(viewModels.enumerated()), id: \.element.id) { index, model in
                cell(viewModel: model, isSelected: index == selection)
                    .onTapGesture {
                        selection = index
                    }
            }
            Spacer()
        }
        .padding()
        .frame(idealHeight: 280)
        .fixedSize(horizontal: false, vertical: true)
    }
}

// MARK: - Private

private extension SegmentedImagePicker {
    func cell(viewModel: ViewModel, isSelected: Bool) -> some View {
        VStack(alignment: .center, spacing: 8.0) {
            if !viewModel.imagePath.isEmpty,
               let image = UIImage(contentsOfFile: viewModel.imagePath) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: .infinity)
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Color.secondary)
            }
            Text(viewModel.title)
                .foregroundColor(.primary)
            CheckmarkView(isSelected: isSelected)
        }
    }
}

// MARK: - Previews

struct SegmentedImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            SegmentedImagePicker(
                selection: .constant(0),
                viewModels: [
                    .init(imagePath: "", title: "img1"),
                    .init(imagePath: "", title: "img2")
                ]
            )
        }
    }
}
