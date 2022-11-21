//
//  OverView.swift
//  TBD_App
//
//  Created by Many Kaufmann on 21.11.22.
//

import SwiftUI

struct OverView: View {
    @State private var showingSheet = false
    //Implement Array with separate View
    private var data: [Int] = Array(1...4)
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    
    var body: some View {
        
        NavigationView{
            LazyVGrid(columns: adaptiveColumns, spacing: 20){
                ForEach (data, id: \.self) {
                    number in ZStack {
                        Rectangle()
                            .frame(width: 170, height: 170)
                            .foregroundColor(.pink)
                            .cornerRadius(30)
                        Button("Show Activity") {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            DetailView()
                        }
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .medium, design: .rounded))
                    }
                }
            }
            .padding()
            .navigationTitle("Hello NAME")
            
                
                
            
        }
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
    }
}
