//
//  VaderAppenViewModel.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-12.
//


import Foundation
import CoreData

class VaderAppenViewModel: ObservableObject{
    @Published var vader: [CityEntity] = []
    var container = PersistenceVader.shared.container
    
    init() {
        
    }
    
    func fetchCity(){
        let request = NSFetchRequest<CityEntity>(entityName: "CityEntity")
        
        do{
            vader = try container.viewContext.fetch(request)
        } catch let error{
            print("error fetching: \(error)")
        }
    }
    func addCity(city: String){
        let newCity = Item(context: container.viewContext)
        newCity.city = city
        
         saveData()
    }
    
    
    func updateCity(entity: CityEntity, newCity: String){
        entity.city = newCity
        
        saveData()
    }
    
    func deleteCity(entity: CityEntity) {
        container.viewContext.delete(entity)
        
        do{
            try container.viewContext.save()
        } catch{
            print("Error deleting entity: \(error)")
        }
        fetchCity()
    }
    func saveData(){
        do{
            try container.viewContext.save()
        }catch let error{
            print("error adding notes \(error)")
        }
        fetchCity()
    }
}
