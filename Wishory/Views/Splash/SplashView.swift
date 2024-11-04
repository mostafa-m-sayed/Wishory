//
//  SplashView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 04/11/2024.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject private var appRootManager: AppRootManager

    var body: some View {
        VStack {
            Image("splash-image")
                .resizable()
        }
        .background(Color(.systemGroupedBackground))
        .onAppear() {
            Task {
                try await Task.sleep(nanoseconds: 3_000_000_000)
                withAnimation(.spring()) {
                    appRootManager.currentRoot = .intro
                }
            }
        }

    }
}

#Preview {
    SplashView()
}
