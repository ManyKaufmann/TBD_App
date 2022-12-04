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
    @Published var customEntities: [CustomData] = []
    @Published var userEntities: [UserData] = []
    
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
            customEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addGoals(param1: String, param2: String, param3: String, param4: String) {
        let newCustomData = CustomData(context: container.viewContext)
        newCustomData.id = UUID()
        newCustomData.startDate = Date.now
        newCustomData.drinkGoal = (param1 as NSString).floatValue
        newCustomData.activityGoal = (param2 as NSString).floatValue
        newCustomData.socialGoal = (param3 as NSString).floatValue
        newCustomData.meTimeGoal = (param4 as NSString).floatValue
        saveData()
        print(Date.now)
    }
    
    func addUser(valueToAdd: String){
        let newUserData = UserData(context: container.viewContext)
        newUserData.name = valueToAdd
        print("new User added " + valueToAdd)
        saveData()
    }
    
    func addData(valueToAdd: String, caseNr: Int){
        var entityToday = customEntities[customEntities.count-1]
        switch caseNr {
        case 1:
            entityToday.drinkCurrent += (valueToAdd as NSString).floatValue
        case 2:
            entityToday.activityCurrent += (valueToAdd as NSString).floatValue
        case 3:
            entityToday.socialCurrent += (valueToAdd as NSString).floatValue
        case 4:
            entityToday.meTimeCurrent += (valueToAdd as NSString).floatValue
        default:
            print("No Case")
        }
        saveData()
    }
    
    // Test func
    func update(entity: CustomData){
        let newData = ("1.0" as NSString).floatValue
        entity.drinkCurrent = newData
        saveData()
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
        let entity = customEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
}
