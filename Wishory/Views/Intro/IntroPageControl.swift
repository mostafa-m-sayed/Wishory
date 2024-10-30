//
//  IntroPageControl.swift
//  Wishory
//
//  Created by Mostafa Sayed on 28/10/2024.
//

import SwiftUI

struct IntroPageControl: View {
    var cards: [IntroCard]
    @Binding var activeCard: IntroCard?
    var body: some View {
        HStack {
            ForEach(cards) { card in
                Button {
                    withAnimation {
                        activeCard = card
                    }
                } label: {
                    Color(.white)
                        .frame(height: 10)
                        .frame(width: activeCard == card ? 30 : 10)
                        .cornerRadius(5)
                        .animation(.easeInOut(duration: 0.3), value: activeCard)
                    
                }
            }
        }
    }
}

#Preview {
    IntroPageControl(cards: [], activeCard: .constant(IntroCard(id: 1, imageName: "", title: "", message: "")))
}
