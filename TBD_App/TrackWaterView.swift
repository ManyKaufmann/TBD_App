//
//  TrackWaterView.swift
//  TBD_App
//
//  Created by Many Kaufmann on 12.12.22.
//

import SwiftUI

struct TrackWaterView: View {
    @StateObject var dataController = DataController()
    @State var fill: CGFloat = 0
    @State var data: String = ""
    
    var inputHeight = 25.0;
    var inputWidth = 70.0;
    var distanceBetweenBlocks = 20.0;
    
    var body: some View {
        var entityToday = dataController.customEntities[dataController.customEntities.count-1]
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
        
        
        HStack{
        Text("Daily").bold()
        
        
        TextField("in liter", text: $data)
            .frame(width: inputWidth, height: inputHeight)
            .padding(5.0)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray.opacity(0.5), lineWidth: 2)
            )
        
            Button("Add") {
                dataController.addData(valueToAdd: data, caseNr: 1)
                data = ""
                
                
                // .onTapGesture {
               //self.fill += data
                
            }
            }
        .padding(20)
       
       
        Button("Add 0.33 dl"){self.fill += 0.33}
        }
        
        }
    


struct TrackWaterView_Previews: PreviewProvider {
    static var previews: some View {
        TrackWaterView()
    }
}
