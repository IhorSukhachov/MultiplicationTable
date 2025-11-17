//
//  ContentView.swift
//  MultiplicationTable
//
//  Created by Ihor Sukhachov on 16.11.2025.
//

import SwiftUI


struct Question {
    var firstMultiplier: Int
    var secondMultiplier: Int
    var correctAnswer: Int {
        firstMultiplier * secondMultiplier
    }
    
    func isCorrect(_ userAnswer: Int) -> Bool {
        self.correctAnswer == userAnswer
    }
    func askQuestion() -> String {
        "\(firstMultiplier) x \(secondMultiplier)"
    }
}

struct ContentView: View {
    @State private var gameIsActive: Bool = false
    @State private var maxTable : Int? = nil
    @State private var questionCount : Int? = nil
    @State private var questions: [Question] = []
    @State private var currentQuestion: Int = 0
    @State private var userAnswer: Int? = nil
    @State private var score = 0
    
    var settings: some View {
        VStack {
            Text("Game Settings")
            Section("Chose a number") {
                TextField("", value: $maxTable, formatter: NumberFormatter()).keyboardType(.numberPad)
            }
            
            Section("Number of questions") {
                TextField("Select a number of questions", value: $questionCount, formatter: NumberFormatter())
            }
           
            Button("Start Game") {
                startGame()
            }.buttonStyle(.borderedProminent)
                .tint(Color.white.opacity(0.5))
        }
    }
    
    var gameWindow: some View {
        VStack {
            if gameIsActive && currentQuestion < questions.count {
                Section("How much is:") {
                    Text(questions[currentQuestion].askQuestion())
                }
                TextField("Your answer is", value: $userAnswer, formatter: NumberFormatter())//.background(.red)
            }
        }
    }
    
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // BEAUTIFUL BACKGROUND
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.85, blue: 0.89),
                        Color(red: 0.93, green: 0.82, blue: 1.0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer()

                    if gameIsActive {
                        gameWindow
                            .padding(40)
                            .background(.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    } else {
                        settings
                            .padding(40)
                            .background(.white.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }

                    Spacer()

                    VStack(spacing: 12) {
                        Text("Your score is: \(score)")
                            .font(.system(.title2, design: .rounded))
                            .bold()

                        Button("Play again") {
                            gameIsActive = false
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .buttonStyle(.borderedProminent)
                        .tint(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal, 30)
                    .navigationTitle("Multiplier")
                }
                .padding()
                .font(.system(.title3, design: .rounded))
            }
        }
    }

    
    func startGame() {
        questions = (0..<(questionCount ?? 0)).map { _ in
            Question(firstMultiplier: Int.random(in: 2...(maxTable ?? 0)),
                     secondMultiplier: Int.random(in: 2...(maxTable ?? 0)))
        }
        currentQuestion = 0
        score = 0
        gameIsActive = true
    }

}



#Preview {
    ContentView()
}
