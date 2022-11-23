//
//  StartView.swift
//  TBD_App
//
//  Created by Many && Nizam on 18.11.22.
//

import SwiftUI

struct StartView: View {
    @State var userName: String = ""
    var body: some View {
        NavigationView {
            VStack() {
                Text("Your Name")
                    .font(.title)
                Spacer().frame(height: 0)
                TextField("", text: $userName)
                    .padding(.leading, 10.0)
                    .frame(width: 300.0, height: 60.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray.opacity(0.5), lineWidth: 2)
                    )
                    .fixedSize()

                Spacer().frame(height: 120)
                Button(){}label: {
                    Text("Start").font(.system(size: 16))
                }
                .frame(width: 140.0, height: 40.0)
                .foregroundColor(Color.indigo)
                    .cornerRadius(0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.indigo.opacity(0.8), lineWidth: 1)
                    )
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}