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
    @State var buttons: [AnswerButton] = []
    @State var correctCount: Int = 0
    @State var incorrectCount: Int = 0

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "checkmark.icloud")
                    .foregroundColor(.green)
                Text("\(correctCount)")
                
                Text("Weather Quiz")
                    .font(.title)
                    .padding(20)
                    .frame(maxWidth: .infinity)
                
                Image(systemName: "xmark.icloud")
                    .foregroundColor(.red)
                Text("\(incorrectCount)")
            }
            Spacer()

            Image(systemName: "rainbow")
                .resizable()
                .frame(width: 300, height: 150)
                .symbolRenderingMode(.multicolor)

            Text(questionsVM.currentQuestion.question)
                .padding(10)
                .fixedSize(horizontal: false, vertical: true)

            Spacer()

            ForEach(buttons) { button in
                button.view
            }

            Spacer()
        }
        .padding()
        .onAppear {
            nextQuestion()
        }
    }

    func handleAnswer(answer: String) {
        if answer == questionsVM.currentQuestion.correctAnswer {
            
            correctCount += 1
        } else {
            
            incorrectCount += 1
        }

        
        print("Selected answer: \(answer)")
        
        nextQuestion()
    }

    func nextQuestion() {
        questionsVM.nextQuestion()
        let currentQuestion = questionsVM.currentQuestion
        let shuffledAnswers = currentQuestion.allAnswers.shuffled()
        buttons = shuffledAnswers.enumerated().map { (index, answer) in
            let iconName: String
            let iconColor: Color
            switch index {
            case 0:
                iconName = "sun.max.fill"
                iconColor = .yellow
            case 1:
                iconName = "drop.fill"
                iconColor = .blue
            case 2:
                iconName = "wind"
                iconColor = .black
            case 3:
                iconName = "icloud.fill"
                iconColor = .gray
            default:
                iconName = ""
                iconColor = .clear
            }
            return AnswerButton(answer: answer, iconName: iconName, iconColor: iconColor, action: handleAnswer)
        }

    }
}

struct AnswerButton: Identifiable {
    let id = UUID()
    let answer: String
    let iconName: String
    let iconColor: Color
    let action: (String) -> Void

    var view: some View {
        Button(action: {
            action(answer)
        }) {
            Image(systemName: iconName)
                .resizable()
                .foregroundColor(iconColor)
                .frame(width: 80, height: 80)
                .padding()

            Text(answer)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
