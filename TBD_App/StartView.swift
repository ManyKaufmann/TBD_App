//
//  StartView.swift
//  TBD_App
//
//  Created by Many && Nizam on 18.11.22.
//

import SwiftUI

struct StartView: View {
    @State var userName: String = ""
    @StateObject var dataController = DataController()
    @State private var selection: String? = nil
    
    var body: some View {

        NavigationView {
            
            VStack() {
                Text("Your Name")
                    .font(.title)
                    .foregroundColor(Color.pink)
                    .frame(width: 300, height: 60)
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    .padding()
                Spacer().frame(height: 0)
                
                TextField("", text: $userName)
                    .padding(.leading, 10.0)
                    .frame(width: 300.0, height: 60.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.pink, lineWidth: 4)
                    )
                    .fixedSize()

                Spacer().frame(height: 120)
                NavigationLink(destination: CustomView(), tag: "CustomView", selection: $selection) {EmptyView()}
                
                
                Button(){
                    guard !userName.isEmpty else {return}
                    dataController.addUser(valueToAdd: userName)
                    userName = ""
                    self.selection = "CustomView"
                }label: {
                    Text("Start").font(.system(size: 24, weight: .medium, design: .rounded))
                }
                .frame(width: 300, height: 60)
                .foregroundColor(Color.white)
                .background(Color.pink)
                .cornerRadius(30)
                
           }
        }.navigationTitle("Back")
            .navigationBarBackButtonHidden(false)
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
