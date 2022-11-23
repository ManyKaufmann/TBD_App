//
//  ResultView.swift
//  TBD_App
//
//  Created by Many & Nizam on 21.11.22.
//

import SwiftUI
import CoreData

class ResultView: ObservableObject {
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
}

struct CoreDataResultResultView: View {
    @StateObject var resultView = ResultView()
    @State var id: String = ""
    @State var drinkInput: String = ""
    @State var activityGoal: String = ""
    @State var socialGoal: String = ""
    @State var meTimeGoal: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            List{
                ForEach(resultView.savedEntities) { entity in
                    Text("List")
                    Text(String(format: "%.1f", entity.drinkGoal))
                    Text(String(format: "%.1f", entity.activityGoal))
                    Text(String(format: "%.1f", entity.socialGoal))
                    Text(String(format: "%.1f", entity.meTimeGoal))
                }
            }
            /*
            TextField("UUID", text: $id)
            TextField("Drinkgoal", text: $drinkInput)
            TextField("Activitygoal", text: $activityGoal)
            TextField("Socialgoal", text: $socialGoal)
            TextField("Metimegoal", text: $meTimeGoal)
             */
            Button(action: {
                print("Button pressed")
                resultView.addCustomData(param1: "2.0", param2: "1.0", param3: "3.0", param4: "0.5")
            }){
                Text("Start")
            }
            
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    
    static var previews: some View {
        CoreDataResultResultView()
    }
}
