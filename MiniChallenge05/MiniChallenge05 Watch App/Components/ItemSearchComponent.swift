//
//  ItemSearchComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by João Ângelo on 23/05/24.
//

import SwiftUI

struct ItemSearchComponent: View {
    
    var body: some View {
        VStack{
            CircularProgressView()
                .frame(width: 100, height: 100)
        }
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
                .trim(from: 0.0, to: min(content.progressPercentage, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: content.progressPercentage)
        }
    }
}
