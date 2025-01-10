//
//  MathView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/8/25.
//

import SwiftUI

struct MathView: View {
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
        VStack {
            Text("Score: \(userScore)")
                .font(.largeTitle.weight(.heavy).lowercaseSmallCaps())
                .foregroundColor(.secondary)
            
            ZStack {

                Rectangle()
                    .frame(width: UIScreen.main.bounds.width - 30, height: 400)
                    .foregroundColor(.orange)
                    .opacity(0.4)
                    .shadow(radius: 10)
                    .cornerRadius(20)
                
                VStack {
                    
                    HStack(spacing: 10) {
                        Spacer()
                        Image("\(currentQuestion?.multiplicand ?? 2)")
                        Image("times")
                        Image("\(currentQuestion?.multiplier ?? 2)")
                    Spacer()
                    }
                    .frame(alignment: .bottom)
                    .padding(.bottom)
                    
                    TextField("0", text: $answer)
                            .keyboardType(.numberPad)
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

            
            Button("Check Answer") {}
                .frame(width: 250, height: 60)
                .modifier(ButtonStyle())
            
//            MARK: - Navigation
                .navigationTitle("\(selectedTable)x Table")
                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .topBarTrailing) {
//                        Text("Score: \(userScore)")
//                    }
//                }
        }
    }
}


#Preview {
    ContentView()
}
