//
//  DataController.swift
//  TBD_App
//
//  Created by Many & Nizam on 21.11.22.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [CustomData] = []
    
    init() {
        container = NSPersistentContainer(name: "CustomDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data. \(error)")
            } else {
                print("Loading Core Data Succeed")
            }
        }
        fetchCustomData()
    }
    
    func fetchCustomData() {
        let request = NSFetchRequest<CustomData>(entityName: "CustomData")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addCustomData(param1: String, param2: String, param3: String, param4: String) {
        let newCustomData = CustomData(context: container.viewContext)
        newCustomData.id = UUID()
        newCustomData.drinkGoal = (param1 as NSString).floatValue
        newCustomData.activityGoal = (param2 as NSString).floatValue
        newCustomData.socialGoal = (param3 as NSString).floatValue
        newCustomData.meTimeGoal = (param4 as NSString).floatValue
        saveData()
        print("Data Added")
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchCustomData()
        } catch let error {
            print("Error saving Data. \(error)")
        }
    }
    
    func deleteData(indexSet: IndexSet){
        guard let index = indexSet.first else {return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
}
