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
        VStack(alignment: .leading, spacing: 25) {
            Text("Game Settings")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .shadow(color: .pink, radius: 10)

            VStack(alignment: .leading) {
                Text("Choose the largest multiplication number:")
                    .foregroundColor(.white.opacity(0.9))

                TextField("Enter max table (e.g. 5 or 10)", value: $maxTable, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)
                    .shadow(color: .pink.opacity(0.6), radius: 10)
            }

            VStack(alignment: .leading) {
                Text("How many questions do you want?")
                    .foregroundColor(.white.opacity(0.9))

                TextField("Number of questions", value: $questionCount, formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .foregroundColor(.white)
                    .shadow(color: .pink.opacity(0.6), radius: 10)
            }

            Button("Start Practice") {
                startGame()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color: Color.pink.opacity(1.0), radius: 20)
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
               
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.30, blue: 0.75),
                        Color(red: 1.0, green: 0.52, blue: 1.0)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 30) {
                    Spacer()

                    Group {
                        if gameIsActive {
                            gameWindow
                        } else {
                            settings
                        }
                    }
                    .padding(35)
                    .background(Color.white.opacity(0.12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .white.opacity(0.4), radius: 20)
                    .padding(.horizontal)

                    Spacer()

                    VStack(spacing: 10) {
                        Text("Your Score: \(score)")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: Color.pink.opacity(0.9), radius: 10)

                        Button("Play Again") {
                            gameIsActive = false
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.25))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: Color.pink.opacity(0.8), radius: 15)
                    }
                    .padding(.horizontal, 40)
                    .navigationTitle("Pink Multiplier")
                    .foregroundColor(.white)
                }
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
