//
//  ProductsVM.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

import Foundation

class ProductsVM: ObservableObject {
    @Published var products: [ProductVM] = []
    @Published var pageState: PageState = .idle

    let service: ProductServiceProtocol
    
    init(service: ProductServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func getProducts() async {
        do {
            let response = try await service.getProducts()
            if let data = response.data {
                await MainActor.run {
                    self.products = data.map({ProductVM(product: $0)})
                    self.pageState = .success
                }
            } else {
                pageState = .idle
            }
        } catch {
            await MainActor.run {
                pageState =  .failure(Helper.shared.getMessageFromError(error))
            }
        }
    }
}
