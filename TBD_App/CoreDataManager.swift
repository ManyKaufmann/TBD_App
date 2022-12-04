//
//  CoreDataManager.swift
//  TBD_App
//
//  Created by Many & Nizam on 27.11.22.
//

import CoreData
import SwiftUI

struct CoreDataManager: View {
    @StateObject var dataController = DataController()
    
    var body: some View {
        var entityToday = dataController.customEntities[dataController.customEntities.count-1]
        VStack{
            List{
                ForEach(dataController.customEntities) { entity in
                    Text("Your Progress")
                    Text("Drink " + String(format: "%.1f", entity.drinkCurrent)+"/"+String(format: "%.1f", entity.drinkGoal))
                    Text("Activity " + String(format: "%.1f", entity.activityCurrent)+"/"+String(format: "%.1f", entity.activityGoal))
                    Text("Social " + String(format: "%.1f", entity.socialCurrent)+"/"+String(format: "%.1f", entity.socialGoal))
                    Text("MeTime " + String(format: "%.1f", entity.meTimeCurrent)+"/"+String(format: "%.1f", entity.meTimeGoal))
                }.onDelete(perform: dataController.deleteData)
            }
          
            Button(action: {
                dataController.addGoals(param1: "2.0", param2: "1.0", param3: "3.0", param4: "0.5")
            }){
                Text("Insert Data")
            }
            Button(action: {
                dataController.addData(valueToAdd: "1.0", caseNr: 1)
            }){
                Text("Update Data")
            }
        }
    }
}

struct CoreDataManager_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataManager()
    }
}
