//
//  HomeView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeOptionsVM: HomeOptionsVM = HomeOptionsVM()
    
    var body: some View {
        VStack {
            HomeHeaderView(options: $homeOptionsVM.optionsVM)
        }.task {
            await homeOptionsVM.getOptions()
        }
    }
}

#Preview {
    HomeView()
}
