//
//  ContentView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor = Color(.lightGray)
    @State private var image = "balloons"
    @State private var selectedTable = 2
    @State private var selectionMade = false
    
    @State private var isCircleVisible = true
    @State private var isHeaderVisible = false
    @State private var opacity = 1.0
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    ZStack {
                        circleView
                        circleImage
                    }
                    
                    
                    instructionView
                    Spacer()
                    
                    //load selection
                    ColorView(selectedColor: $selectedColor, image: $image, selectedTable: $selectedTable, selectionMade: $selectionMade)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    Spacer()
                    NavigationLink(destination: MathView(selectedTable: $selectedTable, selectionMade: $selectionMade)) {
                        startButton
                    }
                    Spacer()
                    
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Multiplication Practice")
                            .font(.title.weight(.bold).smallCaps())
                    }
                }
            }
        }
    }
    
    
    
    
    //    MARK: Header View
    private var instructionView: some View {
        if selectedTable == 0 {
            Text("Choose A Times Table")
                .modifier(InstructionView())
        }
        else if selectedTable > 1 && selectedTable < 13 {
            Text(selectionMade ? "\(selectedTable)x Table" : "Choose A Times Table")
                .modifier(InstructionView())
        } else {
            Text("Wildcard")
                .modifier(InstructionView())
        }
    }
    
    
    //    MARK: - Circle Background
    private var circleView: some View {
        Circle()
            .fill(selectedTable != 0 ? selectedColor : Color(lightBlue))
            .frame(width: 190, height: 190, alignment: .center)
            .shadow(color: .white, radius: 5)
            .opacity(0.8)
            .padding(.bottom)
        
            .scaleEffect(isCircleVisible ? 1 : 0.5) // Scale animation for circle
            .opacity(isCircleVisible ? 1 : 0) // Fade in/out for circle
            .animation(.easeInOut(duration: 0.7))
    }
    
    private var circleImage: some View {
        Image(selectedTable != 0 ? image : "balloons")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .modifier(NumberImage())
    }
    
    
    //    MARK: - Start Button
    private var startButton: some View {
        Button("Start") { }
        .frame(maxWidth: UIScreen.main.bounds.width / 1.5 , minHeight: 40)
        .modifier(ButtonStyle())
        .opacity(selectionMade ? 1 : 0.4)
        .disabled(selectionMade)
    }

    
    
}

#Preview {
    ContentView()
}
