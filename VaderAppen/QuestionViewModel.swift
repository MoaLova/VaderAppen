//
//  QuestionViewModel.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-08.
//

import Foundation


class QuestionsViewModel : ObservableObject {
    var questions = [Question(question: "Vad är den genomsnittliga temperaturen på jorden?", correctAnswer: "15 grader Celsius",
                              incorrectAnswers: ["0 grader Celsius", "10 grader Celsius", "20 grader Celsius"]),
                     Question(question: "Vilken atmosfärisk komponent är mest ansvarig för växthuseffekten?", correctAnswer: "Vattenånga",
                                               incorrectAnswers: ["Kväve", "Syre", "Koldioxid"]),
                     Question(question: "Vilken är den högsta dokumenterade temperaturen på jorden?", correctAnswer: "50 grader Celsius",
                                               incorrectAnswers: ["75 grader Celsius", "60 grader Celsius", "85 grader Celsius"]),
                     Question(question: "Vad kallas en kraftig virvelvind över vatten som kan vara förknippad med kraftiga stormar?", correctAnswer: "Orkan",
                        incorrectAnswers: ["Tromb", "Tornado", "Tyfon"])
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