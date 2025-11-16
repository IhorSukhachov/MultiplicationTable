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
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    Text("Game Settings")
                    TextField("Choose your number", value: $maxTable, formatter: NumberFormatter()).background(Color.yellow)
                    TextField("Select a number of questions", value: $questionCount, formatter: NumberFormatter()).background(.red)
                    Button("Start Game") {
                        startGame()
                    }
                }
                Spacer()
                VStack {
                    if gameIsActive && currentQuestion < questions.count {
                        Text(questions[currentQuestion].askQuestion())
                    }
                    else {
                        Text("Qustion will be here")
                    }
                    TextField("Printyour answer", value: $userAnswer, formatter: NumberFormatter()).background(.red)
                    
                }
                Spacer()
                VStack {
                    Text("Your score is: \(score)")
                    Button("Play again") {
                        
                    }
                }.navigationTitle("Multiplier")
                
            }.background(.green)
            
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
