//
//  OverView.swift
//  TBD_App
//
//  Created by Many Kaufmann on 21.11.22.
//

import SwiftUI

struct OverView: View {
    @State private var showingSheet = false
    @State var fill: CGFloat = 0
    //Implement Array with separate View
    private var data: [Int] = Array(1...4)
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 170))]
    @StateObject var dataController = DataController()
    
    
    var body: some View {
        var entityToday = dataController.customEntities[dataController.customEntities.count-1]
    
        NavigationView {
            VStack {
                Text("Over View")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                
                VStack{
                    HStack{
                        //WATER
                        Circle()
                            .stroke(Color.pink.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(entityToday.drinkCurrent))
                                  

                            .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                            .rotationEffect(.init(degrees: -90))
                            .animation(Animation.linear, value: 3)
                        
                            .padding(20)
                        
                        Circle()
                            .stroke(Color.pink.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                        
                        Circle()
                            .trim(from: 0, to: self.fill)
                            .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                            .rotationEffect(.init(degrees: -90))
                            .animation(Animation.linear, value: 3)
                    }
                    HStack{
                        Circle()
                            .stroke(Color.pink.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                        
                        Circle()
                            .trim(from: 0, to: self.fill)
                            .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                            .rotationEffect(.init(degrees: -90))
                            .animation(Animation.linear, value: 3)
                        
                            .padding(20)
                        
                        Circle()
                            .stroke(Color.pink.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                        
                        Circle()
                            .trim(from: 0, to: self.fill)
                            .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                            .rotationEffect(.init(degrees: -90))
                            .animation(Animation.linear, value: 3)
                    }
                    
                }
                
                
                
          /*      NavigationLink(destination: TrackWaterView()) {
                    Text("Water")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                        .background(.black)
                        .cornerRadius(40)
                        .font(.title)
                }
                .padding(20)
                
               */
                
                /*    LazyVGrid(columns: adaptiveColumns, spacing: 20){
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
                 .navigationTitle("Hello " + dataController.getUser())
                 .navigationBarBackButtonHidden(true)
                 */
                
            }
        }
    }

}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
    }
}
