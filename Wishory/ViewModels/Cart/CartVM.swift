//
//  CartVM.swift
//  Wishory
//
//  Created by Mostafa Sayed on 23/11/2024.
//

import Foundation

class CartVM: ObservableObject {
    @Published var cart: Cart?
    @Published var pageState: PageState = .idle

    let service: CartServiceProtocol
    
    init(service: CartServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func getUserCart() async {
        do {
            let response = try await service.getUserCart()
            if let data = response.data, let cart = data.first {
                await MainActor.run {
                    self.cart = cart
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
