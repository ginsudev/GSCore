//
//  Preferences.swift
//  GSCore
//
//  Created by Noah Little on 29/6/2025.
//

import Foundation
import OSLog

public protocol PreferencesDecodable: Decodable {
    static var path: String { get }
}

@propertyWrapper
public struct Preferences<Value: PreferencesDecodable> {
    
    public var wrappedValue: Value {
        get { Self.get() }
    }
    
    public static func register() {
        PreferenceStore.shared.register(Value.self)
    }
    
    public static func get() -> Value {
        PreferenceStore.shared.get()
    }
    
    public init() { }
}

private final class PreferenceStore {
    static let shared: PreferenceStore = .init()
    
    private let logger: Logger = .init(subsystem: "com.ginsudev.gscore", category: "PreferenceStore")
    private let queue: DispatchQueue = .init(label: "com.ginsudev.gscore.preference-store-queue")
    private var preferences: [String: any PreferencesDecodable] = [:]
    
    func register<P: PreferencesDecodable>(_ descriptor: P.Type = P.self) {
        do {
            let url = URL(fileURLWithPath: P.path)
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let decoded = try decoder.decode(P.self, from: data)
            queue.sync { [weak self] in
                self?.preferences[P.path] = decoded
            }
        } catch {
            logger.error("Failed to read preferences file at \(P.path). Error: \(error)")
        }
    }
    
    func get<P: PreferencesDecodable>(_ type: P.Type = P.self) -> P {
        guard let value = preferences[P.path] as? P else {
            fatalError("Failed to read preferences")
        }
        return value
    }
}
