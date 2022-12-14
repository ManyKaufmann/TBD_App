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
    private var txtContentSize = 16.0
    
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
                    Text("Daily Goal " + String(format: "%.1f", entityToday.drinkCurrent)+" / "+String(format: "%.1f", entityToday.drinkGoal))
                        .foregroundColor(Color.white)
                        .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                    
                    ProgressView(value: entityToday.drinkCurrent, total: entityToday.drinkGoal)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 25)
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
            }
            
            //Activity
            NavigationLink(destination: TrackActivityView()){
                VStack(alignment: .leading) {
                    Button("Track Activity") {
                        checkLoop()
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    Text("Daily Goal " + String(format: "%.1f", entityToday.activityCurrent)+" / "+String(format: "%.1f", entityToday.activityGoal))
                        .foregroundColor(Color.white)
                        .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                    ProgressView(value: entityToday.activityCurrent, total: entityToday.activityGoal)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 25)
                
                   
                    
                    Text("Weekly Goal " + String(format: "%.1f", entityToday.activityCurrent)+" / "+String(format: "%.1f", entityToday.activityGoalWeekly))
                        .foregroundColor(Color.white)
                        .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                    ProgressView(value: entityToday.activityCurrent, total: entityToday.activityGoalWeekly)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 25)
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
            }
            
            
            
            //Social
            NavigationLink(destination: TrackSocialView()){
                VStack(alignment: .leading) {
                    Button("Track Social") {
                        checkLoop()
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    Text("Daily Goal " + String(format: "%.1f", entityToday.socialCurrent)+" / "+String(format: "%.1f", entityToday.socialGoal))
                        .foregroundColor(Color.white)
                        .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                    
                    ProgressView(value: entityToday.socialCurrent, total: entityToday.socialGoal)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 25)
                    
                    Text("Weekly Goal " + String(format: "%.1f", entityToday.socialCurrent)+" / "+String(format: "%.1f", entityToday.socialGoalWeekly))
                        .foregroundColor(Color.white)
                        .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                    
                    ProgressView(value: entityToday.socialCurrent, total: entityToday.socialGoalWeekly)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 25)
                }.padding()
                    .background(Color.pink)
                    .cornerRadius(30)
            }
            
            //ME TIME
            NavigationLink(destination: TrackMeTimeView()){
                VStack(alignment: .leading) {
                    Button("Track Me Time") {
                        checkLoop()
                    }
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .medium, design: .rounded))
                Text("Daily Goal " + String(format: "%.1f", entityToday.meTimeCurrent)+" / "+String(format: "%.1f", entityToday.meTimeGoal))
                    .foregroundColor(Color.white)
                    .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                
                ProgressView(value: entityToday.meTimeCurrent, total: entityToday.meTimeGoal)
                    .cornerRadius(5)
                    .accentColor(Color.yellow)
                    .frame(width: 350, height: 25)
                    
                    Text("Weekly Goal " + String(format: "%.1f", entityToday.meTimeCurrent)+" / "+String(format: "%.1f", entityToday.meTimeGoalWeekly))
                        .foregroundColor(Color.white)
                        .font(.system(size: txtContentSize, weight: .medium, design: .rounded))
                    
                    ProgressView(value: entityToday.meTimeCurrent, total: entityToday.meTimeGoalWeekly)
                        .cornerRadius(5)
                        .accentColor(Color.yellow)
                        .frame(width: 350, height: 25)
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
