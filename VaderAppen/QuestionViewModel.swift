//
//  QuestionViewModel.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-08.
//

import Foundation


class QuestionsViewModel : ObservableObject {
    var questions = [Question(question: "När är julafton?", correctAnswer: "24 dec",
                              incorrectAnswers: ["1 jan", "6 maj", "9 dec"]),
                     Question(question: "Vilket är bäst?", correctAnswer: "Zoom",
                                               incorrectAnswers: ["discord", "teams", "slack"]),
                     Question(question: "Vilket är svårast?", correctAnswer: "Java",
                                               incorrectAnswers: ["swift", "kotlin", "javascript"]),
                     Question(question: "Hur högt är eifeltornet", correctAnswer: "324 m",
                                               incorrectAnswers: ["34 m", "1045 m", "456 m"])
                    ]
    
    @Published var currentQuestion : Question
    
    init() {
        let rand = Int.random(in: 0..<questions.count)
        currentQuestion = questions[rand]
    }
    
    
    func nextQuestion() {
        let rand = Int.random(in: 0..<questions.count)
        currentQuestion = questions[rand]
    }
    
    
    
}
