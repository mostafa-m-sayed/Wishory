//
//  RoundedCornerShape.swift
//  Wishory
//
//  Created by Mostafa Sayed on 28/10/2024.
//
import SwiftUI

struct RoundedCornerShape: Shape {
    var radius: CGFloat = 0.0
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
