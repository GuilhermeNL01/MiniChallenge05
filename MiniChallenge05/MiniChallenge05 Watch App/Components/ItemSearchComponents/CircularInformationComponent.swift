//
//  CircularInformationComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

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
