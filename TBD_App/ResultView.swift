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
            var entityToday = dataController.customEntities[dataController.customEntities.count-1]
            Text("Your Progress")
            Text("Drink " + String(format: "%.1f", entityToday.drinkCurrent)+"/"+String(format: "%.1f", entityToday.drinkGoal))
            Text("Activity " + String(format: "%.1f", entityToday.activityCurrent)+"/"+String(format: "%.1f", entityToday.activityGoal))
            Text("Social " + String(format: "%.1f", entityToday.socialCurrent)+"/"+String(format: "%.1f", entityToday.socialGoal))
            Text("MeTime " + String(format: "%.1f", entityToday.meTimeCurrent)+"/"+String(format: "%.1f", entityToday.meTimeGoal))
            //Text(String(entityToday?.startDate!) ?? "Unknown Date")
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
