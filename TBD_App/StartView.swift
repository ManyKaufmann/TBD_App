//
//  StartView.swift
//  TBD_App
//
//  Created by Nizam on 18.11.22.
//

import SwiftUI

struct StartView: View {
    @State var userName: String = ""
    var body: some View {
        NavigationView {
            VStack() {
                Text("Your Name")
                    .font(.callout)
                Spacer().frame(height: 0)
                TextField("Enter Name...", text: $userName)
                    .frame(width: 300.0, height: 40.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(Color.blue)
                    .fixedSize()

                Spacer().frame(height: 150)
                Button(){}label: {
                    Text("Start")
                }
                .frame(width: 100.0, height: 60.0)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
