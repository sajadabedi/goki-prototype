//
//  CornerRadiusExtensions.swift
//  GuestsAppPrototype
//
//  Created by Sajad Abedi on 07.01.2023.
//

import SwiftUI

struct SmoothCornerModifier: ViewModifier {
    var radius: CGFloat
    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
    }
}

extension View {
    func SmoothCorner(radius: CGFloat) -> some View {
        modifier(SmoothCornerModifier(radius: radius))
    }
}
