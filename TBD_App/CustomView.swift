//
//  CustomView.swift
//  TBD_App
//
//  Created by Many & Nizam on 18.11.22.
//

import SwiftUI
import CoreData

struct CustomView: View {
    @StateObject var dataController = DataController()
    @State var drinkInput: String = ""
    @State var drinkInputAsFloat: Float = 1.0
    @State var activityGoal: String = ""
    @State var socialGoal: String = ""
    @State var meTimeGoal: String = ""
    @State var data: String = ""
    @State private var selection: String? = nil
    
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    var distanceBetweenBlocks = 80.0;
    var btnSize = 50.0

    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Hi " + dataController.getUser() + " Customize your well beeing")
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
                        HStack{
                            Button(){
                                drinkInputAsFloat += 0.1
                            }label: {
                                Text("+").font(.system(size: 30).bold())
                            }
                            .frame(width: btnSize, height: btnSize)
                            .foregroundColor(Color.white)
                            .background(Color.green)
                            .cornerRadius(5)
                            
                            Button(){
                                drinkInputAsFloat += 0.1
                            }label: {
                                Text("-").font(.system(size: 30).bold())
                            }
                            .frame(width: btnSize, height: btnSize)
                            .foregroundColor(Color.white)
                            .background(Color.red)
                            .cornerRadius(5)
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
                    NavigationLink(destination: OverView(), tag: "OverView", selection: $selection) {EmptyView()}
                    Button(action: {
                        guard !drinkInput.isEmpty else {return}
                        guard !activityGoal.isEmpty else {return}
                        guard !socialGoal.isEmpty else {return}
                        guard !meTimeGoal.isEmpty else {return}
                        dataController.addGoals(param1: drinkInput, param2: activityGoal, param3: socialGoal, param4: meTimeGoal)
                        drinkInput = ""
                        activityGoal = ""
                        socialGoal = ""
                        meTimeGoal = ""
                        StateManager.shared.setStartDate()
                        self.selection = "OverView"
                    }, label: {
                        Text("save").font(.system(size: 16))
                    })
                    .frame(width: 140.0, height: 40.0)
                    .foregroundColor(Color.indigo)
                    .cornerRadius(0)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(.indigo.opacity(0.8), lineWidth: 1)
                    )
                }
                Spacer().frame(height: 100)
            }
            .padding(.top, 50.0)
            .padding()
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView()
    }
}
