//
//  DataController.swift
//  TBD_App
//
//  Created by Many & Nizam on 21.11.22.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

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
        let customDataRequest = NSFetchRequest<CustomData>(entityName: "CustomData")
        do {
            customEntities = try container.viewContext.fetch(customDataRequest)
        } catch let error {
            print("Error fetching CustomData. \(error)")
        }
        
        let userDataRequest = NSFetchRequest<UserData>(entityName: "UserData")
        do {
            userEntities = try container.viewContext.fetch(userDataRequest)
        } catch let error {
            print("Error fetching UserData. \(error)")
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
    
    func getUser() -> String{
        return String(userEntities[userEntities.count-1].name ?? " no user found ")
    }
    
    func addUser(valueToAdd: String){
        let newUserData = UserData(context: container.viewContext)
        newUserData.name = valueToAdd
        print("new User added " + valueToAdd)
        saveData()
    }
    
    func addData(valueToAdd: String, caseNr: Int){
        let entityToday = customEntities[customEntities.count-1]
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
    
    func setNewGoal(valueToAdd: String, caseNr: Int){
        let entityToday = customEntities[customEntities.count-1]
        switch caseNr {
        case 1:
            entityToday.drinkGoal = (valueToAdd as NSString).floatValue
        case 2:
            entityToday.activityGoal = (valueToAdd as NSString).floatValue
        case 3:
            entityToday.socialGoal = (valueToAdd as NSString).floatValue
        case 4:
            entityToday.meTimeGoal = (valueToAdd as NSString).floatValue
        default:
            print("No Case")
        }
        saveData()
    }
    
    func setWeeklyGoal(valueToAdd: String, caseNr: Int){
        let entityToday = customEntities[customEntities.count-1]
        switch caseNr {
        case 1:
            entityToday.drinkGoalWeekly = (valueToAdd as NSString).floatValue
        case 2:
            entityToday.activityGoalWeekly = (valueToAdd as NSString).floatValue
        case 3:
            entityToday.socialGoalWeekly = (valueToAdd as NSString).floatValue
        case 4:
            entityToday.meTimeGoalWeekly = (valueToAdd as NSString).floatValue
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
        let customEntity = customEntities[index]
        container.viewContext.delete(customEntity)
        saveData()
    }
}
