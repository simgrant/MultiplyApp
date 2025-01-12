//
//  Modifiers.swift
//  MultiplyApp
//
//  Created by Simone  on 1/8/25.
//

import SwiftUI

struct NumberImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .clipped()
            .shadow(color: .white, radius: 3)
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(lavender))
            .foregroundColor(.white)
            .font(.title.weight(.bold).smallCaps())
            .cornerRadius(20)
            .shadow(radius: 3)
    }
}

var pastelGradient: LinearGradient {
    LinearGradient(
        gradient: Gradient(colors: [
            Color.pink.opacity(0.3),
            Color.blue.opacity(0.3),
            Color.yellow.opacity(0.3)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

var rectangle: some View {
    Rectangle()
        .fill(Color.white.opacity(0.6))
        .frame(width: UIScreen.main.bounds.width * 0.9,  // 90% of screen width
               height: UIScreen.main.bounds.height * 0.7)
        .cornerRadius(20)
        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2) // Center it
        .ignoresSafeArea()
}





