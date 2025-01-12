//
//  ContentView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor = Color(lightBlue)
    @State private var image = "2"
    @State private var selectedTable = 2
    
    
    var body: some View {
        NavigationStack {
            ZStack {
//                pastelGradient
                Color.white
                .ignoresSafeArea()
                rectangle
             
                VStack(spacing: 20) {
                    ZStack {
                        circleView
                        circleImage
                    }
//                    .padding()
                    
                    Spacer()
                    headerView
                    
                    //load selection
                    ColorView(selectedColor: $selectedColor, image: $image, selectedTable: $selectedTable)
                        .padding()

                    
                    NavigationLink(destination: MathView(selectedTable: selectedTable)) {
                        startButton
                    }
                    Spacer()
                    
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Multiplication Practice")
                            .font(.title.weight(.bold).smallCaps())
                            .foregroundColor(.secondary)
                            .shadow(radius: 10)
                    }
                }
            }
        }
    }
    
    
    
    
    //    MARK: Header View
    private var headerView: some View {
        Text("Choose A Times Table")
            .padding(10)
            .cornerRadius(10)
            .font(.title3.weight(.heavy).lowercaseSmallCaps())
            .foregroundColor(.gray)
            .opacity(0.7)
    }
    
    
    //    MARK: - Circle Background
    private var circleView: some View {
        Circle()
            .fill(selectedColor)
            .frame(width: 190, height: 190, alignment: .center)
            .shadow(color: .white, radius: 5)
            .opacity(0.8)
            .padding(.bottom)
    }
    
    private var circleImage: some View {
        Image(image)
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .modifier(NumberImage())
    }
    
    
    //    MARK: - Start Button
    private var startButton: some View {
        Button("Start") {}
            .frame(maxWidth: UIScreen.main.bounds.width / 2 , minHeight: 30)
            .modifier(ButtonStyle())
    }
    
    
    //    MARK: - Background Color
    private var backgroundColor: Color {
        Color(red: 246/255, green: 246/255, blue: 246/255)
    }
    
}

#Preview {
    ContentView()
}
