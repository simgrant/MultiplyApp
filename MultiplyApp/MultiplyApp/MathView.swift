//
//  MathView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/8/25.
//

import SwiftUI

struct MathView: View {
    @Environment(\.dismiss) var dismiss
    let selectedTable: Int
    
    @State private var answer = ""
    @State private var userScore = 0
    @State private var currentQuestion: Question? = nil
    @State private var showAlert = false
    @State private var title = ""
    @State private var message = ""
    
    var question: Question {
        return Question(multiplicand: selectedTable, multiplier: Int.random(in: 2...12))
    }
    
    func checkAnswer() {
        if let userAnswer = Int(answer), userAnswer == currentQuestion?.product {
            userScore += 2
            title = "Correct"
            message = "Keep up the great work!"
        } else {
            title = "Incorrect"
            message = "The answer is \(currentQuestion?.product ?? 0)"
        }
    }
    
    var body: some View {
        ZStack {
//            pastelGradient
//                .ignoresSafeArea()
            //            rectangle
            
            VStack {
                Spacer()
                Text("Score: \(userScore)")
                    .font(.largeTitle.weight(.heavy).lowercaseSmallCaps())
                    .foregroundColor(.secondary)
                
                ZStack {
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 50, height: 350)
                        .foregroundColor(Color(lightBlue))
                        .opacity(0.7)
                        .shadow(radius: 10)
                        .cornerRadius(20)
                    
                    VStack {
                        
                        HStack(spacing: 5) {
                            Spacer()
                            Image("\(currentQuestion?.multiplicand ?? 2)")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .modifier(NumberImage())
                            Image("times")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .modifier(NumberImage())
                            Image("\(currentQuestion?.multiplier ?? 2)")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .modifier(NumberImage())
//                            Image("equal")
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                                .modifier(NumberImage())
                            Spacer()
                        }
                        .frame(alignment: .bottom)
                        .padding(.bottom,30)
                        
                        
                        TextField("0", text: $answer)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .frame(width: 100)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 50))
                            .padding()
                        
                        Text("Enter your answer")
                            .foregroundColor(.secondary)
                            .font(.title3.smallCaps().weight(.heavy))
                            .opacity(0.4)
                        
                    }
                }
                .padding()
                
                Spacer()
                
                Button("Check Answer") {}
                    .frame(width: 250, height: 60)
                    .modifier(ButtonStyle())
                
                Spacer()
                
                //            MARK: - Navigation
                    .navigationTitle("")
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Text("\(selectedTable)x Table")
                                .padding()
                                .font(.title2.weight(.bold))
                                .foregroundColor(.secondary)
                        }
                        
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                // Custom action to dismiss the view
                                dismiss()
                            }) {
                                Image(systemName: "multiply") // Custom icon
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.gray)
                                    .padding()
                            }
                        }
                    }
                
                
            }
        }
    }
}


#Preview {
    ContentView()
}
