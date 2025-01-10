//
//  ContentView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedColor = Color.mint
    @State private var image = "2"
    @State private var selectedTable = 2
    
    
    var body: some View {
        ZStack {
//            .background(backgroundColor)
//                .edgesIgnoringSafeArea(.all)
            
            NavigationStack {
                VStack(spacing: 20) {
                    ZStack {
                        circleView
                        circleImage
                    }
                    .padding()

                        headerView
                    
                    //load selection
                    ColorView(selectedColor: $selectedColor, image: $image, selectedTable: $selectedTable)
                    
                    NavigationLink(destination: MathView(selectedTable: selectedTable)) {
                        startButton
                    }
                }
                .padding()
        
                //      MARK: - Navigation
                .navigationTitle("xMultiply")
//                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    
    
    
//    MARK: Header View
    private var headerView: some View {
            Text("Choose A Table")
                .padding(.top)
                .cornerRadius(10)
                .font(.title3.weight(.heavy).lowercaseSmallCaps())
                .foregroundColor(.secondary)
    }
    
    
//    MARK: - Circle Background
    private var circleView: some View {
        Circle()
            .fill(selectedColor)
            .frame(width: 200, height: 200, alignment: .center)
            .shadow(radius: 5)
            .opacity(0.7)
    }
    
    private var circleImage: some View {
        Image(image)
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .modifier(NumberImage())
    }
    
    
//    MARK: - Start Button
    private var startButton: some View {
        Button("Practice") {}
            .frame(maxWidth: .infinity, minHeight: 30)
            .modifier(ButtonStyle())
    }
    
    
//    MARK: - Background Color
    private var backgroundColor: Color {
        Color(red: 230/255, green: 230/255, blue: 250/255)
    }
    
}

#Preview {
    ContentView()
}
