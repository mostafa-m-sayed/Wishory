//
//  HomeView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeOptionsVM: HomeOptionsVM = HomeOptionsVM()
    @ObservedObject var productsVM: ProductsVM = ProductsVM(service: Constants.mocking ? {ProductServiceMock()}() : ProductService())

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HomeHeaderView(options: $homeOptionsVM.optionsVM)
                    .frame(height: 180)
                
                if productsVM.pageState == .loading {
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else if !productsVM.products.isEmpty {
                    ProductsGalleryView(products: $productsVM.products)
                }
                
            }.task {
                await homeOptionsVM.getOptions()
                await productsVM.getProducts()
            }
        }
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    HomeView()
}
