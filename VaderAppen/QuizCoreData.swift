//
//  QuizCoreData.swift
//  VaderAppen
//
//  Created by Leonardo.Ahlm on 2024-03-05.
//

import SwiftUI
import CoreData

class QuizCoreDataView: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntitites: [AnswersEntity] = []
  
    
    init(){
        container = NSPersistentContainer(name: "QuizData")
        container.loadPersistentStores{(description, error) in
            if let error = error {
                print("Error loading core data \(error)")
            }else {
                print("Success coreData")
            }
        }
        fetchAnswers()
    }
    
    func fetchAnswers(){
        let request = NSFetchRequest<AnswersEntity>(entityName: "AnswersEntity")
        
        do{
          savedEntitites = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching. \(error)")
        }
       
    }
    
    func addAnswers(text: String){
        let newAnswer = AnswersEntity(context: container.viewContext)
        newAnswer.answer = text
        saveData()
        
    }
    
    func saveData(){
        do{
            try container.viewContext.save()
            fetchAnswers()
        } catch let error {
            print("error saving \(error)")
        }
    }
    
}

struct QuizCoreData: View {
    
    
    @StateObject var ViewModel = QuizCoreDataView()
    
    var body: some View {
        QuizCoreData()
    }
}


    
   
