//
//  TrackWaterView.swift
//  TBD_App
//
//  Created by Manynouk Kaufmann & Nizam Oezdemir on 12.12.22.
//

import SwiftUI

struct TrackWaterView: View {
    @StateObject var dataController = DataController()
    @State var fill: CGFloat = 0
    @State var data: String = ""
    @State var goal: String = ""
    @State private var selection: String? = nil
    private var align = 50.0
    @State private var showingAlert = false
    @State private var goalNotReached  = true
    
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    
    var body: some View {
        NavigationLink(destination: ResultView(), tag: "ResultView", selection: $selection) {EmptyView()}
        var entityToday = dataController.customEntities[dataController.customEntities.count-1]
        
        Text("Track Water")
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
                    .trim(from: fill, to: CGFloat(entityToday.drinkGoal))
                    .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(Animation.linear, value: 3)
                Text("\(String(format: "%.1f", self.fill)) l")
                    .foregroundColor(.pink)
                    .font(.system(size: 52))
            }
            .padding(50)
        }
        
        VStack{
            HStack(){
                    Text("Daily")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, align)
                
                    TextField("in liter", text: $data)
                        .frame(width: inputWidth, height: inputHeight)
                        .padding(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(30)
                
                    Button() {
                        dataController.addData(valueToAdd: data, caseNr: 1)
                        data = ""
                        if dataController.customEntities[dataController.customEntities.count-1].drinkCurrent >= dataController.customEntities[dataController.customEntities.count-1].drinkGoal && goalNotReached {
                            showingAlert = true
                        }
                        self.selection = "ResultView"
                    } label: {
                        Text("Add")
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(width: 90, height: 60)
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
                    Text("Goal")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, align)
                
                    TextField("in liter", text: $goal)
                        .frame(width: inputWidth, height: inputHeight)
                        .padding(5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(30)
                
                    Button() {
                        dataController.setDailyGoal(valueToAdd: goal, caseNr: 1)
                        data = ""
                        if dataController.customEntities[dataController.customEntities.count-1].drinkCurrent >= dataController.customEntities[dataController.customEntities.count-1].drinkGoal && goalNotReached {
                            showingAlert = true
                        }
                        self.selection = "ResultView"
                    }label: {
                        Text("Add")
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .frame(width: 90, height: 60)
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
            
            
            Button("Add 0.33 dl"){
                self.fill += 0.33
                dataController.addData(valueToAdd: "0.33", caseNr: 1)
                data = ""
                if dataController.customEntities[dataController.customEntities.count-1].drinkCurrent >= dataController.customEntities[dataController.customEntities.count-1].drinkGoal && goalNotReached {
                    showingAlert = true
                }
                self.selection = "ResultView"
            }
            .alert("You reached your Goals!!!", isPresented: $showingAlert) {
                Button("Ok"){
                    showingAlert = false
                    goalNotReached = false
                }
            }
        }
    }
}
    


struct TrackWaterView_Previews: PreviewProvider {
    static var previews: some View {
        TrackWaterView()
    }
}
