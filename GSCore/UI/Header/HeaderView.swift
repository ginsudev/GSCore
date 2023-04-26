//
//  HeaderView.swift
//  
//
//  Created by Noah Little on 18/3/2023.
//

import SwiftUI

// MARK: - Public

public struct HeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.openURL) var openURL
    @StateObject private var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
    }
    
    public var body: some View {
        contentView
            .padding()
            .background(cardView)
            .fixedSize(horizontal: false, vertical: true)
            .sheet(isPresented: $viewModel.isPresentedMailSheet) {
                MailView(data: $viewModel.mailContent) { _ in }
            }
            .onAppear {
                viewModel.onAppear()
            }
    }
}

// MARK: - Private

private extension HeaderView {
    var cardView: some View {
        RoundedRectangle(cornerRadius: 16.0)
            .frame(maxWidth: .infinity, minHeight: 180)
            .foregroundColor(
                colorScheme == .dark
                ? Colors.darkCellBackground
                : Colors.white
            )
            .shadow(radius: 8)
    }
    
    var contentView: some View {
        VStack(
            alignment: .leading,
            spacing: 5.0
        ) {
            HStack {
                Text(viewModel.title)
                    .font(.system(.largeTitle, design: .rounded))
                    .opacity(viewModel.isLoaded ? 1.0 : 0.0)
                Spacer()
                authorAvatar
            }
            HeaderViewButton(title: viewModel.version, isVisibleBorder: true)
            Spacer()
            Divider()
                .padding(.bottom)
            socialButtons
        }
        .animation(.easeOut(duration: 1.0), value: viewModel.isLoaded)
    }
    
    @ViewBuilder
    var socialButtons: some View {
        HStack {
            ForEach(viewModel.author.socials) { social in
                Button {
                    if case .email = social {
                        viewModel.isPresentedMailSheet = true
                    } else if let url = URL(string: social.link) {
                        openURL(url)
                    }
                } label: {
                    Image(name: social.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Colors.tint)
                }
            }
            Spacer()
            HeaderViewButton(
                title: viewModel.author.name,
                isVisibleBorder: true
            )
        }
    }
    
    var authorAvatar: some View {
        Group {
            if let image = viewModel.authorImage {
                Image(uiImage: image)
                    .resizable()
            } else {
                Image(systemName: "person.fill")
                    .resizable()
            }
        }
        .scaledToFit()
        .frame(width: 35, height: 35)
        .clipShape(Circle())
        .padding(3)
        .background(
            Circle()
                .fill(Color.gray)
                .shadow(radius: 3)
        )
    }
}

// MARK: - Previews

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            viewModel: .init(
                title: "Ginsu's tweak",
                version: "1.0.0",
                author: .ginsu
            )
        )
    }
}

private extension Image {
    init(name: String) {
        let image = UIImage(contentsOfFile: "\(Directory.bundle.rawValue)Images/\(name).png".rootify)
        ?? UIImage(systemName: "questionmark.circle")!
        self.init(uiImage: image.withRenderingMode(.alwaysTemplate))
    }
}
