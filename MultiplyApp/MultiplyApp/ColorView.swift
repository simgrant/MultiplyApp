//
//  ColorView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/8/25.
//

import SwiftUI

struct ColorView: View {
    @Binding var selectedColor: Color
    @Binding var image: String
    @Binding var selectedTable: Int
    
    let colors: [Color] = [.mint, .indigo, .yellow, .pink, .blue, .red, .gray,  .cyan, .purple, .orange, .brown, .teal]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(width: 60, height: 60)
                            .shadow(radius: 2)
                            .opacity(0.9)
                            
                        
                        Image("\(colors.firstIndex(of: color)! + 2)")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                            .modifier(NumberImage())
                            .shadow(radius: 20)
                            
                        
                            .onTapGesture {
                                selectedColor = color
                                image = "\(colors.firstIndex(of: color)! + 2)"
                                selectedTable = colors.firstIndex(of: color)! + 2
                            }
                    }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}




