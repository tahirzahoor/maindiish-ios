//
//  UserDefault.swift
//  BaseCode
//
//  Created by  on 27/07/2023.
//

import Foundation

@propertyWrapper
struct Storage<T> {

    private let key: String
    private let defaultValue: T

    init(wrappedValue: T, _ key: String) {
        self.key = key
        self.defaultValue = wrappedValue
    }

    public var wrappedValue: T {
        get {
            let oldValue = UserDefaults.standard.object(forKey: key) as? T
            switch oldValue as Any {
            case Optional<Any>.some(let value):
                return value as! T
            case Optional<Any>.none:
                return defaultValue
            default:
                return oldValue ?? defaultValue
            }
        }
        set {
            switch newValue as Any {
            case Optional<Any>.some(let value):
                UserDefaults.standard.set(value, forKey: key)
            case Optional<Any>.none:
                UserDefaults.standard.removeObject(forKey: key)
            default:
                UserDefaults.standard.set(newValue, forKey: key)
            }
        }
    }
}
