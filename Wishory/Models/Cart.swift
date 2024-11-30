//
//  Cart.swift
//  Wishory
//
//  Created by Mostafa Sayed on 23/11/2024.
//

struct Cart: Codable {
    let id: Int
    let userId: Int
    let products: [CartProduct]
}
