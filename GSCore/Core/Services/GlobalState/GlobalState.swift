//
//  GlobalState.swift
//  GSCore
//
//  Created by Noah Little on 12/5/2023.
//

import Foundation
import Combine

// MARK: - Public

public final class GlobalState: ObservableObject {
    public static let shared: GlobalState = .init()
    
    @Published public var isLandscape: Bool = false
    
    private var bag: Set<AnyCancellable> = []
    
    private init() {
        subscribe()
    }
}

public extension GlobalState {
    var isLandscapeExcludingiPad: Bool {
        isLandscape && !UIDevice.currentIsIPad()
    }
}

// MARK: - Private

private extension GlobalState {
    func subscribe() {
        // _UIScreenDidChangePeripheryInsetsNotification
        NotificationCenter.default.publisher(for: Notification.Name("_UIScreenDidChangePeripheryInsetsNotification"))
            .receive(on: DispatchQueue.main)
            .map {
                guard let screen = $0.object as? UIScreen,
                      screen.bounds.width > screen.bounds.height
                else { return false }
                return true
            }
            .assign(to: &$isLandscape)
    }
}
