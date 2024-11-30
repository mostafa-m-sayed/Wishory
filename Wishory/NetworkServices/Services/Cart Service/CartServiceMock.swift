//
//  CartServiceMock.swift
//  Wishory
//
//  Created by Mostafa Sayed on 23/11/2024.
//

import Foundation

class CartServiceMock: CartServiceProtocol {
    
    func getUserCart() async throws -> APIResponse<[Cart]> {
        return APIResponse(status: .success, message: nil, data: generateRandomBookings())
    }
}
extension CartServiceMock {
    func generateRandomBookings() -> [Cart] {
        guard let url = Bundle.main.url(forResource: "CartsMock", withExtension: "json") else {
            print("Failed to locate CartsMock.json in bundle.")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON String from URL:\n\(jsonString)")
            } else {
                print("Failed to convert data to string.")
            }
            
            let decoder = JSONDecoder()
            let mockData = try decoder.decode([Cart].self, from: data)
            
            return mockData
        } catch {
            print("Failed to load or parse mockData.json: \(error)")
            return []
        }
    }
}
