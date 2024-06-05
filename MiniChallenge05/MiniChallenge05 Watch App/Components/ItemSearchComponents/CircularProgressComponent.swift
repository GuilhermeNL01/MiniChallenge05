//
//  CircularProgressComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

/**
 The `CircularProgressView` struct displays a circular progress indicator with additional information.
 
 - Parameters:
    - icon: The name of the system icon to display.
    - title: The title associated with the progress.
    - progress: The progress value represented by the circular indicator (0.0 to 1.0).
    - currentDistance: The current distance traveled.
    - totalDistance: The total distance required for completion.
 */
struct CircularProgressView: View {
    var icon: String
    var title: String
    var progress: Double
    var currentDistance: Double
    var totalDistance: Double
    var backgroundColor: Color
    var progressColor: Color

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(progressColor, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)

                Circle()
                    .trim(from: progress, to: 1.0)
                    .stroke(progressColor.opacity(0.3), style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)

                Image(icon)
                    .resizable()
                    .frame(width: Constants.itemWidth, height: Constants.itemHeight)

            }
            .padding(.leading, 5)

            Spacer ()
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()

                HStack {

                    if currentDistance < 1000 {
                        Text("\(Int(currentDistance)) M / \(Int(totalDistance))M")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    } else {
                        Text(String(format: "%.1f", currentDistance / 1000) + " KM / " + String(format: "%.1f", totalDistance / 1000) + " KM")
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }
                }
                
                Spacer()
            }
        }
        .frame(width: Constants.componentWidth)
        .padding(.all, 10)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    CircularProgressView(icon: "camera.fill", title: "Item 06", progress: 0.3, currentDistance: 1500, totalDistance: 2000, backgroundColor: Color(hex: ColorPalette.darkBlue), progressColor: Color(hex:ColorPalette.lightBlue))
}
