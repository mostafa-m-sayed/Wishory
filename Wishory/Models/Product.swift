//
//  Product.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

struct Product: Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let image: String
    let rating: Rating
}
struct Rating: Codable {
    let rate: Double
    let count: Int
}
