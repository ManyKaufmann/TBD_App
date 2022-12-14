//
//  TrackActivityView.swift
//  TBD_App
//
//  Created by Manynouk Kaufmann & Nizam Oezdemir on 18.12.22.
//

import SwiftUI

struct TrackActivityView: View {
    @StateObject var dataController = DataController()
    @State var fill: CGFloat = 0
    @State var data: String = ""
    @State var goal: String = ""
    @State var weeklyGoal: String = ""
    @State private var selection: String? = nil
    @State private var showingAlert = false
    @State private var goalNotReached  = true
    private var align = 20.0
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    @Environment(\.presentationMode) var dismiss
    
    var body: some View {
        NavigationLink(destination: ResultView(), tag: "ResultView", selection: $selection) {EmptyView()}
        var entityToday = dataController.customEntities[dataController.customEntities.count-1]
        
        Text("Track Activity")
            .font(.largeTitle)
            .fontWeight(.medium)
            .foregroundColor(Color.pink)
        
        ZStack{
            ZStack{
                
                Circle()
               //     .trim(from: fill, to: CGFloat(entityToday.drinkGoal))
                    .stroke(Color.pink.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                Circle()
                    //.trim(from: CGFloat(entityToday.drinkGoal), to: fill)
                    .trim(from: fill, to: CGFloat(entityToday.activityGoal))
                    .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(Animation.linear, value: 3)
                Text("Goal: \(String(format: "%.1f", entityToday.activityGoal))h")
                //Text("\(String(format: "%.1f", self.fill)) h / " + "\(String(format: "%.1f", entityToday.activityGoal)) h")
                    .foregroundColor(.pink)
                    .font(.system(size: 35))
            }
            .padding(50)
        }
        
        VStack{
            HStack(){
                    Text("Activity Time")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, align)
                
                    TextField("0.0 h", text: $data)
                        .frame(width: inputWidth, height: inputHeight)
                        .padding(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(30)
                
                    Button() {
                        dataController.addData(valueToAdd: data, caseNr: 2)
                        data = ""
                        self.selection = "ResultView"
                    }label: {
                        Text("Add")
                            .bold()
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(width: 70, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.pink)
                    .cornerRadius(30)
                    .padding(.trailing, align)
                    .alert("You reached your Goals!!!", isPresented: $showingAlert) {
                        Button("Ok"){
                            showingAlert = false
                            goalNotReached = false
                        }
                    }
            }

            
            HStack(){
                    Text("Daily Goal")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, align)
                
                    TextField("0.0 h", text: $goal)
                        .frame(width: inputWidth, height: inputHeight)
                        .padding(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(30)
                
                    Button() {
                        dataController.setDailyGoal(valueToAdd: goal, caseNr: 2)
                        data = ""
                        self.selection = "ResultView"
                    }label: {
                        Text("Set new")
                            .bold()
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(width: 70, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.pink)
                    .cornerRadius(30)
                    .padding(.trailing, align)
                    .alert("You reached your Goals!!!", isPresented: $showingAlert) {
                        Button("Ok"){
                            showingAlert = false
                            goalNotReached = false
                        }
                    }
            }
            
            
            HStack(){
                    Text("Weekly Goal")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, align)
                
                    TextField("0.0 h", text: $weeklyGoal)
                        .frame(width: inputWidth, height: inputHeight)
                        .padding(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(30)
                
                    Button() {
                        dataController.setWeeklyGoal(valueToAdd: weeklyGoal, caseNr: 2)
                        data = ""
                        self.selection = "ResultView"
                    }label: {
                        Text("Set new")
                            .bold()
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(width: 70, height: 40)
                    .foregroundColor(Color.white)
                    .background(Color.pink)
                    .cornerRadius(30)
                    .padding(.trailing, align)
                    .alert("You reached your Goals!!!", isPresented: $showingAlert) {
                        Button("Ok"){
                            showingAlert = false
                            goalNotReached = false
                        }
                    }
            }
            
           /*
            Button("Add 15min"){
                self.fill += 0.33
                dataController.addData(valueToAdd: "0.25", caseNr: 2)
                data = ""
                self.selection = "ResultView"
            }
            
            */
        }
    }
}

struct TrackActivityView_Previews: PreviewProvider {
    static var previews: some View {
        TrackActivityView()
    }
}
