//
//  VaderAppenViewModel.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-12.
//


import Foundation
import CoreData

class VaderAppenViewModel: ObservableObject{
    @Published var vader: [Item] = []
    var container = PersistenceVader.shared.container
    
    init() {
        
    }
    
    func fetchCordinates(){
        let request = NSFetchRequest<Item>(entityName: "Item")
        
        do{
            vader = try container.viewContext.fetch(request)
        } catch let error{
            print("error fetching: \(error)")
        }
    }
    func addCordinates(latitude: Int, longitude: Int){
        let newCity = Item(context: container.viewContext)
        newCity.latitude = Int16(latitude)
        newCity.longitude = Int16(longitude)
        
         saveData()
    }
    
    
    func updateCity(entity: Item, newLatitude: Int, newlongitude: Int){
        entity.latitude = Int16(newLatitude)
        entity.longitude = Int16(newlongitude)
        saveData()
    }
    
    func deleteCity(entity: Item) {
        container.viewContext.delete(entity)
        
        do{
            try container.viewContext.save()
        } catch{
            print("Error deleting entity: \(error)")
        }
        fetchCordinates()
    }
    func saveData(){
        do{
            try container.viewContext.save()
        }catch let error{
            print("error adding notes \(error)")
        }
        fetchCordinates()
    }
}
