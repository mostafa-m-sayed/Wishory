//
//  UserDefaultsCodableWrapper.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

@propertyWrapper
struct UserDefaultsCodableWrapper<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            // Read value from UserDefault
            let decoded: T? = UserDefaults.standard.getObject(key: key)
            return decoded ?? defaultValue
        }
        set {
            // Set value to UserDefaults
//            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.saveObject(rawData: newValue, forKey: key)
        }
    }
}
