//
//  DailyMissionItemComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

// Component for each individual item inside DailyMissionComponent

struct DailyMissionItemComponent: View {
    
    // Parameters passed from DailyMissionComponent
    
    let image: String
    let missionItem: Int
    let currentItem: Int
    let missionCompletion: Bool
    
    var body: some View {
        VStack{
            Image(systemName: "backpack.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
            if missionCompletion == true{
                Text("\(missionItem)/\(missionItem)")
            } else {
                Text("\(currentItem)/\(missionItem)")
            }
        }
    }
}

#Preview {
    DailyMissionItemComponent(image: "backpack.circle.fill", missionItem: 0, currentItem: 0, missionCompletion: false)
}
