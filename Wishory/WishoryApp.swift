//
//  WishoryApp.swift
//  Wishory
//
//  Created by Mostafa Sayed on 28/10/2024.
//

import SwiftUI

@main
struct WishoryApp: App {
    @StateObject private var appRootManager = AppRootManager()

    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashView()
                case .intro:
                    IntroView()
                case .authentication:
                    IntroView()
                case .mainTab:
                    TabBarView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
