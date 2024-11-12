//
//  ProductsGalleryView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//

import SwiftUI

struct ProductsGalleryView: View {
    @Binding var products: [ProductVM]
    
    let columns = [
        GridItem(.adaptive(minimum: 150), spacing: 16)
    ]
    var body: some View {
        ScrollView {
            HStack {
                Text("Popular Products")
                    .font(.title)
                    .foregroundStyle(Constants.AppColors.theme)
                Spacer()
                Text("See All >")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            .padding([.leading, .top, .trailing])
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach($products) { product in
                    ProductCardView(product: product)
                }
            }
            .padding()
        }
    }
}

#Preview {
    let service = ProductServiceMock()
    
    ProductsGalleryView(products: .constant(service.generateRandomBookings().map {ProductVM(product: $0)}))
}
