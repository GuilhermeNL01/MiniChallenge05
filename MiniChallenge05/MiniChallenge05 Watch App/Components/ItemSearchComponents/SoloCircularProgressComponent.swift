//
//  SoloCircularProgressComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct SoloCircularProgressComponent: View {
    var icon: String
    var progress: Double
    var progressColor: Color
    var itemQuantity: Int

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(progressColor, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: Constants.itemWidth*1.25, height: Constants.itemHeight*1.25)

                Circle()
                    .trim(from: progress, to: 1.0)
                    .stroke(progressColor.opacity(0.3), style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: Constants.itemWidth*1.25, height: Constants.itemWidth*1.25)

                Image(icon)
                    .resizable()
                    .frame(width: Constants.smallItemWidth, height: Constants.smallItemHeight)

            }
            
            Text("\(itemQuantity)")
            
        }
    }
}

