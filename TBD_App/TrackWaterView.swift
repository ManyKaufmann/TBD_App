//
//  TrackWaterView.swift
//  TBD_App
//
//  Created by Many Kaufmann on 12.12.22.
//

import SwiftUI

struct TrackWaterView: View {
    @State var fill: CGFloat = 0
    var body: some View {
        ZStack{
            ZStack{
                
                Circle()
                    .stroke(Color.pink.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                
                Circle()
                    .trim(from: 0, to: self.fill)
                    .stroke(Color.pink, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(Animation.linear, value: 3)
                
                Text("\(Int(self.fill)) dl")
                    .foregroundColor(.pink)
                    .font(.system(size: 52))
                
            }
            .padding(50)
        }
        .onTapGesture {
            for x in 0...100 {
                self.fill += 0.01
            }
                
            }
        }
    }


struct TrackWaterView_Previews: PreviewProvider {
    static var previews: some View {
        TrackWaterView()
    }
}
