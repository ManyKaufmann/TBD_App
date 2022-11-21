//
//  DetailView.swift
//  TBD_App
//
//  Created by Many Kaufmann on 21.11.22.
//

import SwiftUI

//Drink
struct DetailView: View {
    @State var data: String = ""
    
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    var distanceBetweenBlocks = 20.0;
    
    var body: some View {
        NavigationView{
            VStack{
                Rectangle()
                    .frame(width: 170, height: 170)
                    .foregroundColor(.pink)
                    .cornerRadius(30)
                    .padding()
                    .navigationTitle("Water")
                
                HStack{
                    
                    Text("Daily").bold()
                        
                    
                    TextField("in liter", text: $data)
                        .frame(width: inputWidth, height: inputHeight)
                        .padding(.leading, 10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray.opacity(0.5), lineWidth: 2)
                        )
                    
                .font(.system(size: 13))
                .frame(maxWidth: .infinity, alignment: .trailing)
                    Spacer().frame(height: distanceBetweenBlocks)
            }
                .padding(20)
                Button(){}label: {
                    Text("Add 0.5 liter").font(.system(size: 16))
                }
               
        }
            
    }
        
    }
}
       


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
