//
//  APIResponse.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//

struct APIResponse<T: Codable>: Codable {
    let status: APIResponseStatus?
    let message: String?
    let data: T?
}

enum APIResponseStatus: String, Codable {
    case success = "success"
    case error = "error"
}
