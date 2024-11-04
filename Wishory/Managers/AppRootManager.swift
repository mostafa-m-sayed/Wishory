//
//  AppRootManager.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

final class AppRootManager: ObservableObject {
    
    @Published var currentRoot: AppRoots

    init() {
        if UsersManager.shared.currentUser != nil {
            self.currentRoot = .authentication
        } else {
            self.currentRoot = .splash
        }
    }
    
    enum AppRoots {
        case splash
        case intro
        case authentication
        case mainTab
    }
}
