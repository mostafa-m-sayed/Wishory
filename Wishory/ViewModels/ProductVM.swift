//
//  ProductVM.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//
import Foundation

class ProductVM: ObservableObject, Identifiable {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    var title: String {
        product.title// ?? ""
    }
    var description: String {
        product.description// ?? ""
    }
    var category: String {
        product.category// ?? ""
    }
//    var price: String {
//        if let price = product.price {
//            return "$" + String(price)
//        }
//        return "$"
//    }
    var price: Double {
        product.price// ?? 0
    }
    var image: String {
        return product.image
    }
}
