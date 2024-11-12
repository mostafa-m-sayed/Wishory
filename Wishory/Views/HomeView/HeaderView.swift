//
//  HeaderView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 11/11/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Wishory")
                    .font(.system(size: 30, weight: .black))
                    .foregroundStyle(Constants.AppColors.theme)
                Text("Explore the world")
                    .font(.system(size: 30, weight: .black))
            }
            .foregroundStyle(Constants.AppColors.theme)
            .padding([.leading, .top])
            Spacer()
            ZStack {
                Color(.clear)
                    .frame(width: 60, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.lightGray, lineWidth: 1)
                    )
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(Constants.AppColors.theme)
                    .fontWeight(.bold)
                
            }
            .padding([.trailing, .top])
        }
    }
}

#Preview {
    HeaderView()
}
