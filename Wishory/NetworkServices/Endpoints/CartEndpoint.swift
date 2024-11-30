//
//  CartEndpoint.swift
//  Wishory
//
//  Created by Mostafa Sayed on 22/11/2024.
//

enum CartEndpoints {
    case getUserCart(userId: Int)
}

extension CartEndpoints: EndpointProtocol {
    var baseURL: String {
        NetworkManager.baseURL
    }
    
    var path: String {
        switch self {
        case .getUserCart(let userId):
            return "/carts/user/\(userId)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getUserCart:
                .GET
        }
    }
    
    var queryParams: [String : Any]? {
        [:]
    }
}
