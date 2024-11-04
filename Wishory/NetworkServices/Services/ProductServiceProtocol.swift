//
//  ProductServiceProtocol.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


protocol ProductServiceProtocol {
    func getProducts() async throws -> APIResponse<[Product]>
}
