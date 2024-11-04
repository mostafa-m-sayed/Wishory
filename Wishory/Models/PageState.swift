//
//  PageState.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


enum PageState: Equatable {
    case idle
    case loading
    case success
    case failure(String)
}