//
//  IntoView.swift
//  Wishory
//
//  Created by Mostafa Sayed on 28/10/2024.
//

import SwiftUI

struct IntroView: View {
    @State private var activeCard: IntroCard?

    private let screenHeight = UIScreen.main.bounds.height

    var cards: [IntroCard] = [
        IntroCard(id: 1, imageName: "product-laptop", title: "Welcome to Wishory", message: "Wishory is a Wish-Story where your shopping wish comes true in a story."),
        IntroCard(id: 2, imageName: "product-mobile", title: "Shop for anything!", message: "You can shop for anything you want, from electronics to home appliances, and more."),
        IntroCard(id: 3, imageName: "product-book", title: "Payment options and delivery methods", message: "We provide various payment and installment methods, along with multiple delivery options")
    ]
    var body: some View {
        VStack(spacing: 20) {
            ZStack {
                Color(.white)
                    .frame(height: screenHeight / 1.8)
                    .clipShape(
                        RoundedCornerShape(radius: 30, corners:[.bottomLeft, .bottomRight])
                    )
                VStack(spacing: 0) {
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(cards, id: \.self) { card in
                                VStack(spacing: 0) {
                                    IntroCardView(card: card)
                                    Spacer()
                                }
                                
                            }
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 0)
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollPosition(id: $activeCard)
                    .scrollIndicators(.never)
                }
                .frame(height: screenHeight / 2)
                .onAppear {
                    activeCard = cards.first
                }
            }
            IntroPageControl(cards: cards, activeCard: $activeCard)
            VStack {
                Text(activeCard?.title ?? "")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.bottom, 3)
                Text(activeCard?.message ?? "")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            Spacer()
            HStack {
                Button {
                    
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .font(.mainButton)
                        .background(.white)
                        .foregroundStyle(.green)
                        .cornerRadius(25)
                        
                    
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
            
            
        }
        .ignoresSafeArea()
        .background(.green)
        
    }
}

#Preview {
    IntroView()
}
struct IntroCard: Identifiable, Hashable {
    var id: Int
    let imageName: String
    let title: String
    let message: String
}
