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
    @State private var showingSheet = false
    @State private var selection: String? = nil
    
    var body: some View {
        
        var entityToday = dataController.customEntities[dataController.customEntities.count-1]
        VStack{
            VStack(){
                Text("Progress today")
                    .foregroundColor(Color.pink)
                    .font(.system(size: 40, weight: .medium, design: .rounded))
            }
            
            
            NavigationLink(destination: TrackWaterView(), tag: "TrackWaterView", selection: $selection) {EmptyView()}
            VStack(alignment: .leading) {
                Button("Show Drink") {
                    self.selection = "TrackWaterView"
                    print("Button pressed")
                }

                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("Drink " + String(format: "%.1f", entityToday.drinkCurrent)+"/"+String(format: "%.1f", entityToday.drinkGoal))
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                        ProgressView(value: entityToday.drinkCurrent, total: entityToday.drinkGoal)
                            .scaleEffect(x: 4, y: 10, anchor: .center)
                            .cornerRadius(5)
                            .accentColor(Color.yellow)
                            .frame(width: 350, height: 50)
                    }.padding()
                        .background(Color.pink)
                        .cornerRadius(30)
                

            VStack(alignment: .leading) {
                Button("Show Activity") {
                    showingSheet.toggle()
                    print("Button pressed")
                }
                .sheet(isPresented: $showingSheet) {
                    TrackWaterView()
                }
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("Activity " + String(format: "%.1f", entityToday.activityCurrent)+"/"+String(format: "%.1f", entityToday.activityGoal))
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                ProgressView(value: entityToday.activityCurrent, total: entityToday.activityGoal)
                    .accentColor(Color.pink)
                    .scaleEffect(x: 4, y: 10, anchor: .center)
                    .cornerRadius(5)
                    .accentColor(Color.yellow)
                    .frame(width: 350, height: 50)
            }.padding()
                .background(Color.pink)
                .cornerRadius(30)
            
            VStack(alignment: .leading) {
                Button("Show Social") {
                    showingSheet.toggle()
                    print("Button pressed")
                }
                .sheet(isPresented: $showingSheet) {
                    TrackWaterView()
                }
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("Social " + String(format: "%.1f", entityToday.socialCurrent)+"/"+String(format: "%.1f", entityToday.socialGoal))
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                
                ProgressView(value: entityToday.socialCurrent, total: entityToday.socialGoal)
                    .accentColor(Color.pink)
                    .scaleEffect(x: 4, y: 10, anchor: .center)
                    .cornerRadius(5)
                    .accentColor(Color.yellow)
                    .frame(width: 350, height: 50)
            }.padding()
                .background(Color.pink)
                .cornerRadius(30)
            
            VStack(alignment: .leading) {
                Button("Show MeTime") {
                    showingSheet.toggle()
                    print("Button pressed")
                }
                .sheet(isPresented: $showingSheet) {
                    TrackWaterView()
                }
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("MeTime " + String(format: "%.1f", entityToday.meTimeCurrent)+"/"+String(format: "%.1f", entityToday.meTimeGoal))
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                
                ProgressView(value: entityToday.meTimeCurrent, total: entityToday.meTimeGoal)
                    .accentColor(Color.pink)
                    .scaleEffect(x: 4, y: 10, anchor: .center)
                    .cornerRadius(5)
                    .accentColor(Color.yellow)
                    .frame(width: 350, height: 50)
            }.padding()
                .background(Color.pink)
                .cornerRadius(30)
        }.padding()
        /*
        VStack(spacing: 20) {
            var entityToday = dataController.customEntities[dataController.customEntities.count-1]
            Text("Your Progress")
            Text("Drink " + String(format: "%.1f", entityToday.drinkCurrent)+"/"+String(format: "%.1f", entityToday.drinkGoal))
            Text("Activity " + String(format: "%.1f", entityToday.activityCurrent)+"/"+String(format: "%.1f", entityToday.activityGoal))
            Text("Social " + String(format: "%.1f", entityToday.socialCurrent)+"/"+String(format: "%.1f", entityToday.socialGoal))
            Text("MeTime " + String(format: "%.1f", entityToday.meTimeCurrent)+"/"+String(format: "%.1f", entityToday.meTimeGoal))
        }
         */
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
