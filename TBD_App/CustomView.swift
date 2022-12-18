//
//  CustomView.swift
//  TBD_App
//
//  Created by Manynouk Kaufmann & Nizam Oezdemir on 18.11.22.
//

import SwiftUI
import CoreData

struct CustomView: View {
    @StateObject var dataController = DataController()
    @State var drinkGoal: String = ""
    @State var activityGoal: String = ""
    @State var socialGoal: String = ""
    @State var meTimeGoal: String = ""
    @State var activityGoalWeekly: String = ""
    @State var socialGoalWeekly: String = ""
    @State var meTimeGoalWeekly: String = ""
    @State var data: String = ""
    @State private var selection: String? = nil
    
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    var distanceBetweenBlocks = 80.0;
    var btnSize = 50.0

    
    var body: some View {
            VStack{
                HStack{
                    Text("Hi " + dataController.getUser() + ", set your goals!")
                        .foregroundColor(.pink)
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                }
                Spacer().frame(height: 40)
                VStack(alignment: .center){
                    
                    // Drink Section
                    VStack (alignment: .leading){
                        HStack(){
                            Label("", systemImage: "star.fill")
                            Text("Drink goal:").font(.system(size: 13))
                            HStack{
                                Text("Daily").bold()
                                
                                TextField("in liter", text: $drinkGoal)
                                    .frame(width: inputWidth, height: inputHeight)
                                    .padding(.leading, 10.0)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                                    )
                                
                            }.font(.system(size: 13))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
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
                                TextField("in hours", text: $activityGoalWeekly)
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
                                TextField("in hours", text: $socialGoalWeekly)
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
                                TextField("in hours", text: $meTimeGoalWeekly)
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
                    NavigationLink(destination: ResultView(), tag: "ResultView", selection: $selection) {EmptyView()}
                    Button(action: {
                        if drinkGoal.isEmpty {
                            drinkGoal = "0.0"
                        }
                        if activityGoal.isEmpty {
                            activityGoal = "0.0"
                        }
                        if socialGoal.isEmpty {
                            socialGoal = "0.0"
                        }
                        if meTimeGoal.isEmpty {
                            meTimeGoal = "0.0"
                        }
                        if activityGoalWeekly.isEmpty {
                            activityGoalWeekly = "1.0"
                        }
                        if socialGoalWeekly.isEmpty {
                            socialGoal = "1.0"
                        }
                        if meTimeGoalWeekly.isEmpty {
                            meTimeGoal = "1.0"
                        }
                        dataController.addDailyGoals(param1: drinkGoal, param2: activityGoal, param3: socialGoal, param4: meTimeGoal, param5: activityGoalWeekly, param6: socialGoalWeekly, param7: meTimeGoalWeekly)
                        StateManager.shared.setStartDate()
                        self.selection = "ResultView"
                    }, label: {
                        Text("Save").font(.system(size: 24, weight: .medium, design: .rounded))
                    })
                    .frame(width: 300, height: 60)
                    .foregroundColor(Color.white)
                    .background(Color.pink)
                    .cornerRadius(30)
                }
                Spacer().frame(height: 100)
            }
            .padding(.top, 50.0)
            .padding()
        }
    
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
