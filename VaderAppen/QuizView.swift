//
//  QuizView.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-02-29.
//

import SwiftUI

import SwiftUI

struct QuizView: View {
    @State var text: String = ""
    @StateObject var questionsVM = QuestionsViewModel()

    var body: some View {
        VStack {
            HStack {
                Text("07.00")
                    .position(x: 50, y: 10)

                Button(action: {
                    print("nein")
                }) {
                    Image(systemName: "cloud.sun")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 70, height: 50)
                        .position(x: 130, y: 10)
                }
            }

            Text("Weather Quiz")
                .position(x: 190, y: -180)
                .font(.title)

            ZStack {
                Image(systemName: "rainbow")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .position(x: 200, y: -300)
                    .symbolRenderingMode(.multicolor)

                VStack {
                    Spacer()

                    Text(questionsVM.currentQuestion.question)
                        .multilineTextAlignment(.center)

                    Spacer()

                    Button(action: {
                        handleAnswer(answer: questionsVM.currentQuestion.correctAnswer)
                    }) {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 100, height: 100)
                            .position(x: 100, y: -160)
                    }

                    Button(action: {
                        handleAnswer(answer: questionsVM.currentQuestion.incorrectAnswers[0])
                    }) {
                        Image(systemName: "drop.fill")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 60, height: 70)
                            .position(x: 100, y: -60)
                    }

                    Button(action: {
                        handleAnswer(answer: questionsVM.currentQuestion.incorrectAnswers[1])
                    }) {
                        Image(systemName: "wind")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 80, height: 80)
                            .position(x: 100, y: 40)
                    }

                    Button(action: {
                        handleAnswer(answer: questionsVM.currentQuestion.incorrectAnswers[2])
                    }) {
                        Image(systemName: "icloud.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 100, height: 80)
                            .position(x: 100, y: 140)
                    }

                    Spacer()
                }
            }
            .onAppear {
                nextQuestion()
            }
        }
    }

    func handleAnswer(answer: String) {
        // Implement your answer handling logic here
        print("Selected answer: \(answer)")
        // You might want to check if the answer is correct and proceed accordingly
    }

    func nextQuestion() {
        // Implement logic to load the next question
        // This might involve updating your QuestionsViewModel
    }
}

#if DEBUG
struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
#endif
