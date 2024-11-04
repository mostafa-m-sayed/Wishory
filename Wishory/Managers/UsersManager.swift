//
//  UsersManager.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

class UsersManager {
    static var shared = UsersManager()
    
    var currentUser: User? {
        guard let user = activeUser else { return nil }
        return user
    }
    
    var current: User? {
        didSet {
            self.activeUser = current
        }
    }

    var token: String? {
        return currentUser?.accessToken
    }
    
    private init() {}
    
    @UserDefaultsCodableWrapper(key: "active-user", defaultValue: nil)
    private var activeUser: User?
}
