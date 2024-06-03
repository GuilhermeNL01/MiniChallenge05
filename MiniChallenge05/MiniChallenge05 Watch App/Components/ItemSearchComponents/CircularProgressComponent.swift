//
//  CircularProgressComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

struct CircularProgressView: View {
    var icon: String
    var title: String
    var progress: Double
    var currentDistance: Double
    var totalDistance: Double

    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)

                Circle()
                    .trim(from: progress, to: 1.0)
                    .stroke(Color.blue.opacity(0.3), style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)

                Image(systemName: icon)
                    .foregroundColor(.blue)
                    .font(.title)
            }
            .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)

                HStack {
                    Image(systemName: "figure.walk")
                        .foregroundColor(.white)
                    Text("\(Int(currentDistance)) M / \(Int(totalDistance))M")
                        .font(.system(size:11))
                        .foregroundColor(.white)
                        .lineLimit(1)

                        
                }
            }
        }
        .padding()
        .background(Color.purple)
        .cornerRadius(10)
    }
}

#Preview{
    CircularProgressView(icon: "camera.fill", title: "Item 06", progress: 30, currentDistance: 500, totalDistance: 1000)
}
