//
//  Untitled.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//

enum ProductEndpoints {
    case getProducts
    case getProduct(id: Int)
}

extension ProductEndpoints: EndpointProtocol {
    var baseURL: String {
        NetworkManager.baseURL
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .getProduct(let id):
            return "/products/\(id)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getProduct, .getProducts:
                .GET
        }
    }
    
    var queryParams: [String : Any]? {
        [:]
    }
}
