//
//  ResultView.swift
//  TBD_App
//
//  Created by Many & Nizam on 21.11.22.
//

import SwiftUI
import CoreData

struct ResultView: View {
    @StateObject var dataController = DataController()
    
    var body: some View {
        VStack(spacing: 20) {
            var entityToday = dataController.savedEntities[dataController.savedEntities.count-1]
            Text("Your Progress")
            Text("Drink " + String(format: "%.1f", entityToday.drinkCurrent)+"/"+String(format: "%.1f", entityToday.drinkGoal))
            Text("Activity " + String(format: "%.1f", entityToday.activityCurrent)+"/"+String(format: "%.1f", entityToday.activityGoal))
            Text("Social " + String(format: "%.1f", entityToday.socialCurrent)+"/"+String(format: "%.1f", entityToday.socialGoal))
            Text("MeTime " + String(format: "%.1f", entityToday.meTimeCurrent)+"/"+String(format: "%.1f", entityToday.meTimeGoal))
            //Text(String(entityToday?.startDate!) ?? "Unknown Date")
            
            Button(action: {
                print("Start Button pressed")
                print(entityToday.startDate ?? Date.now)
                dataController.addGoals(param1: "2.0", param2: "1.0", param3: "3.0", param4: "0.5")
            }){
                Text("Start")
            }
            Button(action: {
                print("Update Button pressed")
                dataController.update(entity: dataController.savedEntities[0])
            }){
                Text("Update")
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}

/*
List{
    ForEach(dataController.savedEntities) { entity in
        //if (Calendar.current.isDateInToday(entity.startDate)) {
            print("True")
            Text("Your Progress")
            Text("Drink " + String(format: "%.1f", entity.drinkCurrent)+"/"+String(format: "%.1f", entity.drinkGoal))
            Text("Activity " + String(format: "%.1f", entity.activityCurrent)+"/"+String(format: "%.1f", entity.activityGoal))
            Text("Social " + String(format: "%.1f", entity.socialCurrent)+"/"+String(format: "%.1f", entity.socialGoal))
            Text("MeTime " + String(format: "%.1f", entity.meTimeCurrent)+"/"+String(format: "%.1f", entity.meTimeGoal))
        //}
    }.onDelete(perform: dataController.deleteData)
    
    // Beispiel: Zugriff auf einzelnes Dateielement
    // [n]th result Element from CoreData array in DataController.savedEntities
    //let data = dataController.savedEntities[0].meTimeGoal
    // Konvertierung von Float auf String
    //Text(String(format: "%.1f", data))
}
*/
