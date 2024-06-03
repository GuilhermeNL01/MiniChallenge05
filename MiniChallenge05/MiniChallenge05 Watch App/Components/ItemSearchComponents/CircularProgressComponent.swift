//
//  CircularProgressComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

struct CircularProgressView: View {
    @ObservedObject var content = ContentViewModel()
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.1)
                .foregroundColor(.blue)
            Circle()
                .trim(from: 0.0, to: min(content.progressPercentage, content.dailyGoal))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: content.progressPercentage)
        }
        .onAppear {
            content.requestAuthorization()
        }
    }
}
