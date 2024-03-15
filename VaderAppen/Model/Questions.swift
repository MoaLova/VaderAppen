//
//  Questions.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-08.
//


struct Question: Equatable {
    var question: String
    var correctAnswer: String
    var incorrectAnswers: [String]

    var allAnswers: [String] {
        return [correctAnswer] + incorrectAnswers
    }

}
