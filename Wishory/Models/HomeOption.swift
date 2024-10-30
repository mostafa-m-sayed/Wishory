//
//  HomeOption.swift
//  Wishory
//
//  Created by Mostafa Sayed on 30/10/2024.
//

struct HomeOption: Identifiable {
    let id: Int
    let title: String
}

extension HomeOption {
    static func testValues() -> [HomeOption] {
        [
            .init(id: 1, title: "New Arrivals"),
            .init(id: 2, title: "Online Exclusive"),
            .init(id: 3, title: "Electronics"),
            .init(id: 4, title: "Applicance & Home"),
        ]
    }
}
