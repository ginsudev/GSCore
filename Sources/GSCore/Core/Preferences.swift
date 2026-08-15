//
//  Preferences.swift
//  GSCore
//
//  Created by Noah Little on 29/6/2025.
//

import Foundation

public protocol PreferencesContainer: AnyObject {
    var path: String { get }
}

@propertyWrapper
public struct PreferenceValue<Value> {
    private let key: String
    private let defaultValue: Value
    
    public static subscript<InstanceType: PreferencesContainer>(
        _enclosingInstance instance: InstanceType,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<InstanceType, Value>,
        storage storageKeyPath: ReferenceWritableKeyPath<InstanceType, Self>
    ) -> Value {
        get {
            let propertyInstance = instance[keyPath: storageKeyPath]
            let dict = PreferenceStore.shared.getDict(for: instance.path)
            return (dict[propertyInstance.key] as? Value) ?? propertyInstance.defaultValue
        }
        @available(*, unavailable)
        set { }
    }
    
    @available(*, unavailable, message: "@PreferenceValue Can only be applied to classes")
    public var wrappedValue: Value {
        get { fatalError("Not implemented") }
        set { fatalError("Not implemented") }
    }
    
    public init(wrappedValue defaultValue: Value, _ key: String) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

private final class PreferenceStore {
    static let shared: PreferenceStore = .init()
    
    private let queue: DispatchQueue = .init(label: "com.ginsudev.gscore.preference-store-queue")
    private var preferences: [String: [String: Any]] = [:]
    
    func getDict(for path: String) -> [String: Any] {
        queue.sync { [weak self] in
            if let dict = self?.preferences[path] {
                return dict
            } else {
                let url = URL(fileURLWithPath: path)
                let dict = url.plistDict()
                self?.preferences[path] = dict
                return dict
            }
        }
    }
}
