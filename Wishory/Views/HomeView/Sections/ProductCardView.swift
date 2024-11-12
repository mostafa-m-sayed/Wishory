//
//  ProductCardView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//

import SwiftUI
import Kingfisher
struct ProductCardView: View {
    @Binding var product: ProductVM

    var body: some View {
        VStack {
            KFImage(URL(string: product.image))
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(10)
                .padding(.bottom, 8)
            
            Text(product.title)
                .font(.headline)
                .padding(.bottom, 4)
                .multilineTextAlignment(.center)
                .lineLimit(2)
            Text(product.description)
                .font(.caption)
                .padding(.bottom, 4)
                .lineLimit(2)
            
            HStack {
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(Constants.AppColors.theme)
                Spacer()
                ZStack {
                    Constants.AppColors.theme
                        .frame(width: 25, height: 25)
                        .cornerRadius(5)
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                }
                
            }
        }
        .padding()
        .background(Color.backGroundLightGray)
        .cornerRadius(20)
    }
}

#Preview {
    var service = ProductServiceMock()
    let product = ProductVM(product: service.generateRandomBookings().first!)
    ProductCardView(product: .constant(product))
}
