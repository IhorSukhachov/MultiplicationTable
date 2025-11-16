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
    @State private var maxTable : Int = 0
    @State private var questionCount : Int = 0
    @State private var questions: [Question] = []
    @State private var currentQuestion: Int = 0
    @State private var userAnswer: Int? = nil
    @State private var score = 0
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Game Settings")
                TextField("Choose your number", value: $maxTable, formatter: NumberFormatter()).background(Color.yellow)
                TextField("Select a number of questions", value: $questionCount, formatter: NumberFormatter()).background(.red)
                Button("Start Game") {
                    //do smth
                }
            }
            Spacer()
            VStack {
       //         Text(questions.randomElement(in: 0..<questions.count)?.askQuestion())
            }
            Spacer()
            VStack {
                Text("Your score is: \(score)")
                Button("Play again") {
                    
                }
            }
        }.frame(width: 600, height: 600)
    }
}

#Preview {
    ContentView()
}
