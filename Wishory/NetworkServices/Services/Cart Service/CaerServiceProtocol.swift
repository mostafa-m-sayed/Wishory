//
//  CaerServiceProtocol.swift
//  Wishory
//
//  Created by Mostafa Sayed on 23/11/2024.
//

protocol CartServiceProtocol {
    func getUserCart() async throws -> APIResponse<[Cart]>
}
