//
//  CartView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 11/11/2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cartVM: CartVM = CartVM(service: Constants.mocking ? {CartServiceMock()}() : CartService())
    @State var products: [ProductVM]?
    var body: some View {
        VStack(spacing: 0) {
            Color(.systemGroupedBackground)
                .frame(height: 5)
            VStack(spacing: 0) {
//                NavigationView {
                    List {
                        HeaderView()
                            .frame(height: 180)
                            .listRowInsets(EdgeInsets())
                        ForEach(productsVM.products) { product in
                            CartItemView()
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .background(Color(.systemGroupedBackground))
                    .scrollContentBackground(.hidden)
                    .listStyle(PlainListStyle())
                    
//                }
//                .navigationTitle("Products")
            }
            .clipShape(RoundedCornerShape(radius: 50, corners: [.bottomLeft, .bottomRight]))
            .padding(.bottom)
        }
        .ignoresSafeArea(edges: [.top])
        .background(Constants.AppColors.theme)
        .task {
            await cartVM.getUserCart()
            
        }
    }
}

#Preview {
    CartView()
}
