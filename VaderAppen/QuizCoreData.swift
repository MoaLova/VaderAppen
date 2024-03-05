//
//  QuizCoreData.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-03-05.
//

import SwiftUI
import CoreData

class QuizCoreDataView: ObservableObject {
    
    let container = NSPersistentContainer(name: "QuizData")
    
    init(){
        container.loadPersistentStores{(description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }else {
                print("Success coreData")
            }
        }
    }
    func fetchAnswers(){
        let request = NSFetchRequest<AnswersEntity>(entityName: "AnswersEntity")
    }
    
}

struct QuizCoreData: View {
    
    
    @StateObject var ViewModel = QuizCoreDataView()
    
    var body: some View {
        QuizCoreData()
    }
}

struct QuizCoreData_Previews: PreviewProvider {
    static var previews: some View {
        QuizCoreData()
    }
}
    
   
