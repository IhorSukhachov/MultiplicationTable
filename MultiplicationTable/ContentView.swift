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
}

struct ContentView: View {
    @State private var gameIsActive: Bool
    @State private var maxTable : Int
    @State private var questionCount : Int
    @State private var questions: [Question] = []
    @State private var currentQuestion: Int = 0
    @State private var userAnswer: Int? = nil
    @State private var score = 0
    
    
    var body: some View {
        
    }
}

/*
#Preview {
    ContentView()
}*/
