//
//  CustomView.swift
//  TBD_App
//
//  Created by Many & Nizam on 18.11.22.
//

import SwiftUI
import CoreData

class CustomView: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntities: [CustomData] = []
    
    init() {
        container = NSPersistentContainer(name: "CustomDataModel")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error Loading Core Data. \(error)")
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

struct CoreDataResultCustomView: View {
    @StateObject var customView = CustomView()
    @State var drinkInput: String = ""
    @State var activityGoal: String = ""
    @State var socialGoal: String = ""
    @State var meTimeGoal: String = ""
    @State var data: String = ""
    
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    var distanceBetweenBlocks = 60.0;
    
    var body: some View {
        VStack{
            HStack{
                Text("Customize your well beeing")
                    .bold()
            }
            Spacer().frame(height: 40)
            VStack(alignment: .center){
                
                // Drink Section
                
                HStack(){
                        Label("", systemImage: "star.fill")
                        Text("Drink goal:").font(.system(size: 13))
                        HStack{
                                Text("Daily").bold()
                                
                                TextField("in liter", text: $drinkInput)
                                    .frame(width: inputWidth, height: inputHeight)
                                    .padding(.leading, 10.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                                    )

                            }.font(.system(size: 13))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Spacer().frame(height: distanceBetweenBlocks)
              
                // Activity Section
                
                    HStack(){
                        Label("", systemImage: "star.fill")
                        Text("Activity goal hour:").font(.system(size: 13))
                        
                        VStack{
                            HStack{
                                Text("Daily").bold()
                                    .padding(.leading, 50.0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("in hours", text: $activityGoal)
                                    .frame(width: inputWidth, height: inputHeight)
                                    .padding(.leading, 10.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                                    )
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                            }
                            
                            HStack{
                                Text("Weekly").bold()
                                    .padding(.leading, 50.0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                TextField("in hours", text: $data)
                                    .frame(width: inputWidth, height: inputHeight)
                                    .padding(.leading, 10.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                                    )
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }.font(.system(size: 13))
                            .padding(.bottom, -37.0)
                    }
                Spacer().frame(height: distanceBetweenBlocks)
              
                // Activity Section
                
                HStack(){
                    Label("", systemImage: "star.fill")
                    Text("Activity goal hour:").font(.system(size: 13))
                    
                    VStack{
                        HStack{
                            Text("Daily").bold()
                                .padding(.leading, 50.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("in hours", text: $socialGoal)
                                .frame(width: inputWidth, height: inputHeight)
                                .padding(.leading, 10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                )
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack{
                            Text("Weekly").bold()
                                .padding(.leading, 50.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("in hours", text: $data)
                                .frame(width: inputWidth, height: inputHeight)
                                .padding(.leading, 10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                )
                                .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }.font(.system(size: 13))
                        .padding(.bottom, -37.0)
                }
                Spacer().frame(height: distanceBetweenBlocks)
              
                // Activity
                    
                HStack(){
                    Label("", systemImage: "star.fill")
                    Text("Activity goal hour:").font(.system(size: 13))
                    
                    VStack{
                        HStack{
                            Text("Daily").bold()
                                .padding(.leading, 50.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("in hours", text: $meTimeGoal)
                                .frame(width: inputWidth, height: inputHeight)
                                .padding(.leading, 10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                )
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack{
                            Text("Weekly").bold()
                                .padding(.leading, 50.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            TextField("in hours", text: $data)
                                .frame(width: inputWidth, height: inputHeight)
                                .padding(.leading, 10.0)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(.gray.opacity(0.5), lineWidth: 2)
                                )
                                .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }.font(.system(size: 13))
                        .padding(.bottom, -37.0)
                }
                Spacer()
                
                // Button
                
                Button(action: {
                    print("Button pressed")
                    guard !drinkInput.isEmpty else {return}
                    guard !activityGoal.isEmpty else {return}
                    guard !socialGoal.isEmpty else {return}
                    guard !meTimeGoal.isEmpty else {return}
                    print("Nothing empty")
                    customView.addCustomData(param1: drinkInput, param2: activityGoal, param3: socialGoal, param4: meTimeGoal)
                    print("Func addCustomData() has been executeed")
                    drinkInput = ""
                    activityGoal = ""
                    socialGoal = ""
                    meTimeGoal = ""
                    
                }, label: {
                    Text("save").font(.system(size: 16))
                })
                .frame(width: 140.0, height: 40.0)
                .foregroundColor(Color.indigo)
                .cornerRadius(0)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(.indigo.opacity(0.8), lineWidth: 1)
                )
                Spacer()
                /*
                Group{}
                List {
                    ForEach(customView.savedEntities) { entity in
                        Group{
                            Text("Hello")
                        }
                    }
                }
                 */
             
            
            }
            Spacer().frame(height: 100)

        }
        .padding(.top, 50.0)
        .padding()
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataResultCustomView()
    }
}
