//
//  CartItemView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 11/11/2024.
//

import SwiftUI

struct CartItemView: View {
    var body: some View {
        HStack {
            Image("product-laptop")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width / 3)
                .clipped()
                .cornerRadius(10)
                .padding([.leading, .top, .bottom],10)
            
            VStack(alignment: .leading, spacing: 5) {

                Text("Macbook Air")
                    .font(.headline)

                HStack {
                    Text("A nice macbook for hard working people")
                        .font(.caption)
                        .padding(.bottom, 4)
                        .lineLimit(2)
                }
                
                HStack {
                    Text("$\(25.8, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Spacer()
                    .frame(width: 50, height: 50)
                }
                
            }
            .padding(.leading, 10)
            
            Spacer()
            VStack(spacing: 15) {
                Image(systemName: "plus")
                ZStack {
                    Constants.AppColors.theme
                        .frame(width: 30, height: 30)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Text("2")
                        .foregroundStyle(.white)
                        
                }
                Image(systemName: "minus")
            }
            .padding(.trailing)
        }
        .frame(height: 140)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    CartItemView()
}
