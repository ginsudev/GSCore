//
//  Author.swift
//  GSCore
//
//  Created by Noah Little on 25/3/2023.
//

import Foundation

public struct Author {
    let name: String
    let twitterHandle: String
    let socials: [Social]
    
    var profilePictureURL: URL? {
        URL(string: "https://unavatar.io/twitter/\(twitterHandle)?fallback=false")
    }
    
    public init(
        name: String,
        twitterHandle: String,
        socials: [Social] = []
    ) {
        self.name = name
        self.twitterHandle = twitterHandle
        self.socials = socials
    }
}

public extension Author {
    enum Social: Identifiable {
        case twitter(link: String)
        case discord(link: String)
        case paypal(link: String)
        case email(address: String)
        
        public var imageName: String {
            switch self {
            case .twitter: return "twitter"
            case .discord: return "discord"
            case .paypal: return "paypal"
            case .email: return "email"
            }
        }
        
        public var link: String {
            switch self {
            case let .twitter(link): return link
            case let .discord(link): return link
            case let .paypal(link): return link
            case let .email(address): return address
            }
        }
        
        public var id: String { imageName }
    }
    
    
    static var ginsu: Self {
        .init(
            name: "Ginsu",
            twitterHandle: "ginsudev",
            socials: [
                .discord(link: "https://discord.com/invite/BhdUyCbgkZ"),
                .twitter(link: "https://twitter.com/ginsudev"),
                .paypal(link: "https://paypal.me/xiaonuoya"),
                .email(address: "njl02@outlook.com")
            ]
        )
    }
}
