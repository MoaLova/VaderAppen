//
//  QuizView.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-02-29.
//

import SwiftUI

struct QuizView: View {
    @State var text: String = ""
    @StateObject var questionsVM = QuestionsViewModel()
    
    var body: some View {
        
        Text("Weather Quiz")
            .font(.title)
            .padding(20)
        Spacer()
        
        VStack {
            Image(systemName: "rainbow")
                .resizable()
                .frame(width: 300, height: 150)
                .symbolRenderingMode(.multicolor)
            
            Text(questionsVM.currentQuestion.question)
                           .padding(10)
                           .fixedSize(horizontal: false, vertical: true)
            Spacer()
            
            Button(action: {
                handleAnswer(answer: questionsVM.currentQuestion.correctAnswer)
            }) {
                Image(systemName:"sun.max.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 80, height: 80)
                    .padding()
                Text(questionsVM.currentQuestion.correctAnswer)
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
            }
            
            Button(action: {
                handleAnswer(answer: questionsVM.currentQuestion.incorrectAnswers[0])
            }) {
                Image(systemName:"drop.fill")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 60, height: 70)
                .padding()
                Text(questionsVM.currentQuestion.incorrectAnswers[0])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Button(action: {
                handleAnswer(answer: questionsVM.currentQuestion.incorrectAnswers[1])
            }) {
                Image(systemName:"wind")
                 .resizable()
                   .foregroundColor(.black)
                    .frame(width: 80, height: 80)
                    .padding()
                Text(questionsVM.currentQuestion.incorrectAnswers[1])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Button(action: {
                handleAnswer(answer: questionsVM.currentQuestion.incorrectAnswers[2])
            }) {
                Image(systemName:"icloud.fill")
                  .resizable()
                  .foregroundColor(.gray)
                  .frame(width: 100, height: 80)
                  .padding()
                Text(questionsVM.currentQuestion.incorrectAnswers[2])
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            
            
        }.onAppear {
            nextQuestion()
        }
        
    }
    
    func handleAnswer(answer: String) {
        // Implement your answer handling logic here
        print("Selected answer: \(answer)")
        // You might want to check if the answer is correct and proceed accordingly
        nextQuestion()
    }

    func nextQuestion() {
        // Implement logic to load the next question
        // This might involve updating your QuestionsViewModel
        questionsVM.nextQuestion()
    }
}
    #Preview {
        QuizView()
    }

