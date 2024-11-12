//
//  TabBarView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {
                        VStack(spacing: 0) {
                            Image("tabbar-home")
                                .renderingMode(.template)
                            Text("Cart")
                        }
                    }
                CartView()
                    .tabItem {
                        VStack(spacing: 0) {
                            Image("tabbar-cart")
                                .renderingMode(.template)
                            Text("Cart")
                        }
                    }
                HomeView()
                    .tabItem {
                        VStack(spacing: 0) {
                            Image("tabbar-more")
                                .renderingMode(.template)
                            Text("More")
                        }
                    }
            }
            .toolbarBackground(Constants.AppColors.theme, for: .tabBar)
                        .toolbarBackground(.visible, for: .tabBar)
            
        }
        .accentColor(.white)
    }
    
}

#Preview {
    TabBarView()
}
