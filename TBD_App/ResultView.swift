//
//  ResultView.swift
//  TBD_App
//
//  Created by Manynouk Kaufmann & Nizam Oezdemir on 21.11.22.
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
            //Water
            NavigationLink(destination: TrackWaterView(), tag: "TrackWaterView", selection: $selection) {
                VStack(alignment: .leading) {
                    Button("Track Water") {
                        checkLoop()
                        self.selection = "TrackWaterView"
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    Text("Drink " + String(format: "%.1f", entityToday.drinkCurrent)+"/"+String(format: "%.1f", entityToday.drinkGoal))
                        .foregroundColor(Color.white)
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                    
                    ProgressView(value: entityToday.drinkCurrent, total: entityToday.drinkGoal)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 50)
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
            }
            
            //Activity
            NavigationLink(destination: TrackActivityView()){
                VStack(alignment: .leading) {
                    Button("Track Activity") {
                        checkLoop()
                        // showingSheet.toggle()
                    }
                    //.sheet(isPresented: $showingSheet) {
                    //NavigationLink(destination: TrackActivityView(), tag: "TrackActivityView", selection: $selection) {EmptyView()}
                    //   TrackActivityView()
                    // }
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    Text("Activity " + String(format: "%.1f", entityToday.activityCurrent)+"/"+String(format: "%.1f", entityToday.activityGoal))
                        .foregroundColor(Color.white)
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                    ProgressView(value: entityToday.activityCurrent, total: entityToday.activityGoal)
                        .accentColor(Color.pink)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 50)
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
            }
            
            
            
            //Social
            NavigationLink(destination: TrackSocialView()){
                VStack(alignment: .leading) {
                    Button("Track Social") {
                        checkLoop()
                        //     showingSheet.toggle()
                    }
                    //  .sheet(isPresented: $showingSheet) {
                    //      TrackSocialView()
                    // }
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    Text("Social " + String(format: "%.1f", entityToday.socialCurrent)+"/"+String(format: "%.1f", entityToday.socialGoal))
                        .foregroundColor(Color.white)
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                    
                    ProgressView(value: entityToday.socialCurrent, total: entityToday.socialGoal)
                        .accentColor(Color.pink)
                    //.scaleEffect(x: 4, y: 10, anchor: .center)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 50)
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
            }
            
            //ME TIME
            NavigationLink(destination: TrackMeTimeView()){
                VStack(alignment: .leading) {
                    Button("Track MeTime") {
                        checkLoop()
                        //   showingSheet.toggle()
                    }
                    // .sheet(isPresented: $showingSheet) {
                    //    TrackMeTimeView()
              //  }
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("MeTime " + String(format: "%.1f", entityToday.meTimeCurrent)+"/"+String(format: "%.1f", entityToday.meTimeGoal))
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                
                ProgressView(value: entityToday.meTimeCurrent, total: entityToday.meTimeGoal)
                    .accentColor(Color.pink)
                    .cornerRadius(5)
                    .accentColor(Color.yellow)
                    .frame(width: 350, height: 50)
            }.padding()
                .background(Color.pink)
                .cornerRadius(30)
        }
        }
        .padding()
    }
    
    
    
    func checkLoop(){
        if StateManager.shared.loopIsExpired() {
            print("Loop exp")
        }
    }

    

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
}
