//
//  ProductServiceMock.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

class ProductServiceMock: ProductServiceProtocol {
    
    func getProducts() async throws -> APIResponse<[Product]> {
        return APIResponse(status: .success, message: nil, data: generateRandomBookings())
    }
}
extension ProductServiceMock {
    func generateRandomBookings() -> [Product] {
        // Locate the file in the bundle
           guard let url = Bundle.main.url(forResource: "ProductsMock", withExtension: "json") else {
               print("Failed to locate mockData.json in bundle.")
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
               let mockData = try decoder.decode([Product].self, from: data)
               
               return mockData
           } catch {
               print("Failed to load or parse mockData.json: \(error)")
               return []
           }
    }
}
