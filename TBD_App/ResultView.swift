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
            List{
                ForEach(dataController.savedEntities) { entity in
                    Text("List")
                    Text(String(format: "%.1f", entity.drinkGoal))
                    Text(String(format: "%.1f", entity.activityGoal))
                    Text(String(format: "%.1f", entity.socialGoal))
                    Text(String(format: "%.1f", entity.meTimeGoal))
                }.onDelete(perform: dataController.deleteData)
                
                // Beispiel: Zugriff auf einzelnes Dateielement
                // [n]th result Element from CoreData array in DataController.savedEntities
                let data = dataController.savedEntities[1].meTimeGoal
                // Konvertierung von Float auf String
                Text(String(format: "%.1f", data))
            }
            
            // Test insert data
            Button(action: {
                print("Button pressed")
                dataController.addCustomData(param1: "2.0", param2: "1.0", param3: "3.0", param4: "0.5")
            }){
                Text("Test")
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
