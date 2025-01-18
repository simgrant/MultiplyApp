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
    @Binding var selectionMade: Bool
    
    let colors: [Color] = [Color(azalea), Color(cottonCandy), Color(bilobaFlower), Color(tropicalBlue), Color(malibu), Color(melanie), Color(solitude), Color(jordyBlue), Color(aquamarine), Color(prim), Color(perfume), Color(lavender)]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
//                        Circle()
                            .fill(color)
                            .frame(width: 70, height: 70)
                            .shadow(radius: 3)
                            .opacity(0.7)
                            
                        
                        Image("\(colors.firstIndex(of: color)! + 2)")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                            .modifier(NumberImage())
                            
                        
                            .onTapGesture {
                                selectedColor = color
                                image = "\(colors.firstIndex(of: color)! + 2)"
                                selectedTable = colors.firstIndex(of: color)! + 2
                                selectionMade = true
                            }
                    }
                }
            }
        }
        .padding([.bottom, .leading, .trailing])
    }
}




