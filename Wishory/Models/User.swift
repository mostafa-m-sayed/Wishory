//
//  User.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


struct User: Codable, Hashable {
    
    let id: Int
    let name: String?
    let email: String?
    let phone: String?
    let gender: String?
    let photo: String?
    let unreadNotificationsCount: Int?

    var accessToken: String?

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}
