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
            .shadow(radius: 10)
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.blue)
            .foregroundColor(.white)
            .font(.title.weight(.bold).smallCaps())
            .cornerRadius(20)
            .shadow(radius: 5)
//            .padding()
    }
}
