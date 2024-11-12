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
        VStack(spacing: 0) {
            Color(.systemGroupedBackground)
                .frame(height: 60)
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
                    let arr = [1, 2, 3, 4]
                    var arr2 = [Int]()
                    for i in 0...arr.count - 1 {
                        var newArr = arr
                        newArr.remove(at: i)
                        arr2.append(newArr.reduce(1,* ))
                    }
                    print(arr2)
                    await homeOptionsVM.getOptions()
                    await productsVM.getProducts()
                }
            }
            .background(Color(.systemGroupedBackground))
            .clipShape(RoundedCornerShape(radius: 50, corners: [.bottomLeft, .bottomRight]))
            .padding(.bottom)
        }
        .ignoresSafeArea(edges: [.top])
        .background(Constants.AppColors.theme)
    }
        
}

#Preview {
    HomeView()
}
