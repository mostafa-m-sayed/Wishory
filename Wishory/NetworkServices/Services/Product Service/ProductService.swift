//
//  ProductService.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//

class ProductService: ProductServiceProtocol {
    func getProducts() async throws -> APIResponse<[Product]> {
        throw NetworkManager.NetworkError.invalidURL
    }
}
