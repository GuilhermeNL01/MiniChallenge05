//
//  ItemSearchComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by João Ângelo on 23/05/24.
//

import SwiftUI

struct ItemSearchComponent: View {
    var body: some View {
    HStack{
            CircularProgressView()
                .frame(width: 50, height: 50)
            CircularProgressViewInformation()
        }
        .frame(width: 164, height: 66)
    }
}

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

struct CircularProgressViewInformation: View {
    @ObservedObject var content = ContentViewModel()
    
    var body: some View {
        VStack{
            Text("Item 01")
            HStack{
                Image(systemName: "figure.walk")
                Text("\(content.progressPercentage) M/ \(content.dailyGoal) M")
            }
        }
    }
}
