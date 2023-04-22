//
//  ImageLoader.swift
//  GSCore
//
//  Created by Noah Little on 19/3/2023.
//

import UIKit
import Combine

public struct ImageLoader {
    public init() { }
    
    public func fetchImage(url: URL) -> AnyPublisher<UIImage?, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap({ result in
                guard validateResponse(result.response) else { throw URLError(.badURL) }
                return UIImage(data: result.data)
            })
            .eraseToAnyPublisher()
    }
    
    private func validateResponse(_ response: URLResponse) -> Bool {
        guard let response = response as? HTTPURLResponse,
              (200..<300).contains(response.statusCode)
        else { return false }
        return true
    }
}
