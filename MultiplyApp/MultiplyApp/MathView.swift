//
//  MathView.swift
//  MultiplyApp
//
//  Created by Simone  on 1/8/25.
//

import SwiftUI

struct MathView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var selectedTable: Int
    let totalQuestions = 2
    
    @State private var currentQuestionIndex = 1
    @State private var answer = ""
    @State private var isCorrect = false
    @State private var correctAnswers = 0
    @State private var userScore: Double = 0
    @State private var currentQuestion: Question?
    @State private var showAlert = false
    @State private var showFeedback = false
    @State private var showFinalScore = false
    @State private var title = ""
    @State private var message = ""
    @State private var isQuestionAnswered = false
    @State private var isButtonDisabled = true
    
    var question: Question {
        return Question(multiplicand: selectedTable, multiplier: Int.random(in: 2...12))
    }
    
    
// MARK: - Body
    var body: some View {
        VStack {
            progressView
            Spacer()
            
            ZStack {
                cardView
                
                VStack(spacing: 20) {
                    questionView
                        .frame(alignment: .bottom)
                        .padding(.bottom,30)
                    
                    HStack(spacing: 30) {
                        if showFeedback {
                            if !isCorrect {
                                incorrectView
                            }
                        }
                        answerField
                        if showFeedback {
                            if isCorrect {
                                correctView
                            }
                        }
                    }
                    if !isQuestionAnswered {
                        answerFieldPrompt
                    }
                }
            }
            .padding()
            
            Spacer()
            checkAnswerOrNextButton
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
                            dismiss() //dismiss the view
                        }) {
                            Image(systemName: "multiply") // Custom icon
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                }
            
//            MARK: - State Changes
                .onAppear {
                    randomizeSelectedTable()
                    currentQuestion = question
                }
            
                .alert(title, isPresented: $showAlert) {
                    Button("Continue") {
                        if currentQuestionIndex == totalQuestions {
                            isPracticeOver()
                        } else {
                            nextQuestion()
                        }
                    }
                } message: {
                    Text(message)
                }
            
                .sheet(isPresented: $showFinalScore) {
                    VStack {
                        Text(userScore > 75 ? "Great Job!" : "Keep Practicing!")
                                .font(.largeTitle.weight(.heavy))
                        Image(userScore > 75 ? "hooray" : "try_again")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                        Text("Your score is \(Int(userScore))%.")
                            .font(.title.weight(.medium))
                            .padding(.bottom)
                        Button("Dismiss") {
                            showFinalScore.toggle()
                            dismiss()
                        }
                            .frame(width: 220, height: 60)
                            .modifier(ButtonStyle())
                            .padding()
                    }
                }
            
        }
    }
    
    
    
    // MARK: - Functions
        func checkAnswer() {
            if let userAnswer = Int(answer), userAnswer == currentQuestion?.product {
                correctAnswers += 1
                isCorrect = true
                showAlert = false
            } else {
                title = "Incorrect"
                message = "The answer is \(currentQuestion?.product ?? 0)"
                isCorrect = false
                showAlert = true
            }
            showFeedback = true
            isQuestionAnswered = true
        }
        
        func nextQuestion() {
            isPracticeOver()
            //keep track of user input
            isQuestionAnswered = false
            //hide feedback view
            showFeedback = false
            //load next question & score
            currentQuestion = question
            currentQuestionIndex += 1
            //reset textfield
            answer = ""
        }
        
        func randomizeSelectedTable() {
            selectedTable = selectedTable == 13 ? Int.random(in: 2...12) : selectedTable
        }
        
        func isPracticeOver() {
            if currentQuestionIndex == totalQuestions {
                userScore = (Double(correctAnswers) / Double(totalQuestions)) * 100
                showFinalScore = true
            }
        }

        
    
    
    //    MARK: - Custom Views
    
    private var progressView: some View {
        ProgressView("", value: Double(currentQuestionIndex - 1), total: Double(totalQuestions))
            .progressViewStyle(.linear)
            .frame(height: 20)
            .accentColor(Color(lightBlue))
            .padding()
    }
    
    private var cardView: some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width / 1.2, height: 450)
            .foregroundColor(Color(lightBlue))
            .opacity(0.7)
            .shadow(radius: 10)
            .cornerRadius(20)
    }
    
    private var questionView: some View {
        HStack(spacing: 5) {
            Spacer()
            Image("\(selectedTable)")
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
            Spacer()
        }
    }
    
    private var answerField: some View {
        TextField("0", text: $answer)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 100)
            .textFieldStyle(.roundedBorder)
            .font(.system(size: 50))
            .padding()
    }
    
    private var answerFieldPrompt: some View {
        Text("Enter your answer")
            .foregroundColor(.secondary)
            .font(.title3.smallCaps().weight(.heavy))
            .opacity(0.5)
    }
    
    private var checkAnswerOrNextButton: some View {
        Button(action: {
            if isQuestionAnswered {
                nextQuestion()
            } else {
                    checkAnswer()
                }
        }) {
            if currentQuestionIndex == totalQuestions {
                Text(isQuestionAnswered ? "See Results" : "Check Answer")
                    .frame(width: 220, height: 60)
                    .modifier(ButtonStyle())
                    .opacity(!answer.isEmpty ? 1 : 0.5)
            } else {
                Text(isQuestionAnswered ? "Next Question" : "Check Answer")
                    .frame(width: 220, height: 60)
                    .modifier(ButtonStyle())
                    .opacity(!answer.isEmpty ? 1 : 0.5)
            }
        }
        .disabled(answer.isEmpty)
    }
    
    private var incorrectView: some View {
        Image("incorrect")
            .frame(width: 15, height: 15)
    }
    
    private var correctView: some View {
        Image("correct")
            .frame(width: 15, height: 15)
    }
    
    
}


#Preview {
    ContentView()
}
