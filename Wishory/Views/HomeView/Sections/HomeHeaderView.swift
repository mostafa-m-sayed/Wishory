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
        VStack(spacing: 0) {
            HeaderView()
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(options) { option in
                        Text(option.title)
                            .padding()
                            .background(Color.backGroundLightGray)
                            .foregroundStyle(Constants.AppColors.theme)
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
