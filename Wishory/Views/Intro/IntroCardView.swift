//
//  IntroCardView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 29/10/2024.
//

import SwiftUI

struct IntroCardView: View {
    @State var card: IntroCard
    var height: CGFloat = 450
    var body: some View {
        Image(card.imageName)
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: height)
            .background(.background)
    }
}

#Preview {
    IntroCardView(card: IntroCard(id: 1, imageName: "product-laptop", title: "Hello", message: "This is a test article"))
}
