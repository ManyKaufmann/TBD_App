//
//  ResultView.swift
//  TBD_App
//
//  Created by Many & Nizam on 21.11.22.
//

import SwiftUI
import CoreData

struct ResultView: View {
    
    @Environment(\.managedObjectContext) var test
    @FetchRequest(sortDescriptors: []) var customData: FetchedResults<CustomData>
    
    
    var body: some View {
        VStack{
            List(customData) { data in
                Text("\(data.id!)")
                Text("\(data.drinkGoal)")
                Text("\(data.activityGoal)")
                Text("\(data.socialGoal)")
                Text("\(data.meTimeGoal)")
            }
            Button("add") {
                let customData = CustomData(context: test)
                customData.id = UUID()
                customData.drinkGoal = 2
                customData.activityGoal = 1
                customData.socialGoal = 1
                customData.meTimeGoal = 1
                
                try? test.save()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
