//
//  HomeHeaderView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

import SwiftUI

struct HomeHeaderView: View {
    @Binding var options: [HomeOptionVM]

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Wishory")
                        .font(.system(size: 30, weight: .black))
                        .foregroundStyle(Color.darkGreen)
                    Text("Explore the world")
                        .font(.system(size: 30, weight: .black))
                }
                .foregroundStyle(Color.darkGreen)
                .padding([.leading, .top])
                Spacer()
                ZStack {
                    Color(.white)
                        .frame(width: 60, height: 100)
                        .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.lightGray, lineWidth: 1)
                            )
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.darkGreen)
                        .fontWeight(.bold)
                    
                }
                .padding([.trailing, .top])
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(options) { option in
                        Text(option.title)
                            .padding()
                            .background(Color.lightGray)
                            .foregroundStyle(Color.darkGreen)
                            .fontWeight(.medium)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
            Spacer()
            
        }
    }
}

#Preview {
    HomeHeaderView(options: .constant([]))
}
