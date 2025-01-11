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
    
    let colors: [Color] = [Color(lightBlue), Color(pastelPink), Color(mustard), Color(lavender), Color(peachyRose), .red, .gray,  .cyan, .purple, .orange, .brown, .teal]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color)
                            .frame(width: 70, height: 70)
                            .shadow(color: .white, radius: 5)
                            .opacity(0.9)
                            
                        
                        Image("\(colors.firstIndex(of: color)! + 2)")
                            .resizable()
                            .frame(width: 45, height: 45, alignment: .center)
                            .modifier(NumberImage())
                            
                        
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




