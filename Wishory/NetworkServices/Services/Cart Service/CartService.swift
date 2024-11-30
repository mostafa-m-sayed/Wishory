//
//  CartService.swift
//  Wishory
//
//  Created by Mostafa Sayed on 23/11/2024.
//

class CartService: CartServiceProtocol {
    func getUserCart() async throws -> APIResponse<[Cart]> {
        throw NetworkManager.NetworkError.invalidURL
    }
}
