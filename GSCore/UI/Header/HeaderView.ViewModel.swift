//
//  HeaderView.ViewModel.swift
//  
//
//  Created by Noah Little on 18/3/2023.
//

import UIKit.UIImage
import Combine

public extension HeaderView {
    final class ViewModel: ObservableObject {
        let title: String
        let version: String
        let author: Author
        
        private let imageLoader = ImageLoader()
        private var bag = Set<AnyCancellable>()
        
        @Published private(set) var authorImage: UIImage?
        @Published var isLoaded = false
        @Published var isPresentedMailSheet = false
        
        @Published var mailContent: MailView.ComposeMailData
        
        public init(
            title: String,
            version: String,
            author: Author
        ) {
            self.title = title
            self.version = version
            self.author = author
            
            let emailAddress: String = {
                for social in author.socials {
                    if case let .email(address) = social {
                        return address
                    }
                }
                return ""
            }()
            
            self.mailContent = .init(
                subject: "\(title) v\(version) support",
                recipients: emailAddress.isEmpty ? [] : [emailAddress],
                message: Copy.UI.whatsTheProblem,
                attachments: nil
            )
        }
    }
}

// MARK: - Internal

internal extension HeaderView.ViewModel {
    func onAppear() {
        isLoaded = true
        do {
            try fetchAuthorImage()
        } catch {
            NSLog("[GSCore](HeaderView): Can't get image")
        }
    }
}

// MARK: - Private

private extension HeaderView.ViewModel {
    func fetchAuthorImage() throws {
        guard let url = author.profilePictureURL else { throw URLError(.badURL) }
        
        imageLoader.fetchImage(url: url)
            .sink { _ in
                
            } receiveValue: { image in
                if let image {
                    self.authorImage = image
                }
            }
            .store(in: &bag)
    }
}
