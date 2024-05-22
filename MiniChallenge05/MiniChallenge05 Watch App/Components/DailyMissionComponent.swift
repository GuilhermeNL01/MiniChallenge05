//
//  DailyMissionComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 22/05/24.
//

import SwiftUI
import SwiftData

struct DailyMission: Codable {
    var missionDescription: String
    var missionItemAlpha: Int
    var missionItemBravo: Int
    var missionItemCharlie: Int
    var missionItemDelta: Int
}

struct DailyMissionComponent: View {
    
    @Environment(\.modelContext) var context
    @Query var dailyMissionList: [ModelNew]
    
    @State private var dailyMissionCurrent: DailyMission = DailyMission(
        missionDescription: "",
        missionItemAlpha: 0,
        missionItemBravo: 0,
        missionItemCharlie: 0,
        missionItemDelta: 0
    )
    
    private let missionDescriptions = [
        "Collect 10 apples",
        "Defeat 5 enemies",
        "Find the hidden treasure",
        "Complete the puzzle"
    ]
    
    var body: some View {
        VStack {
            Text(dailyMissionList.first?.dailyMission.missionDescription ?? "No mission today")
                .font(.headline)
                .padding()
            
            HStack {
                Text("A: \(dailyMissionList.first?.dailyMission.missionItemAlpha ?? 0)")
                Text("B: \(dailyMissionList.first?.dailyMission.missionItemBravo ?? 0)")
                Text("C: \(dailyMissionList.first?.dailyMission.missionItemCharlie ?? 0)")
                Text("D: \(dailyMissionList.first?.dailyMission.missionItemDelta ?? 0)")
            }
            .padding()
            
            Button(action: generateNewMission) {
                Text("Generate New Mission")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
//        .onAppear(perform: generateNewMission)
    }
    
    private func generateNewMission() {
        dailyMissionCurrent = DailyMission(
            missionDescription: missionDescriptions.randomElement() ?? "No mission today",
            missionItemAlpha: Int.random(in: 0...10),
            missionItemBravo: Int.random(in: 0...7),
            missionItemCharlie: Int.random(in: 0...5),
            missionItemDelta: Int.random(in: 1...4)
        )
        
        if let existingMission = dailyMissionList.first {
            // Update the existing mission
            existingMission.dailyMission = dailyMissionCurrent
        } else {
            // Create a new mission if none exists
            let modelDailyMission = ModelNew(dailyMission: dailyMissionCurrent)
            context.insert(modelDailyMission)
        }
        
        // Save changes to the context
        try? context.save()
    }
}

#Preview {
    DailyMissionComponent()
}