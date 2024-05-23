//
//  DailyMissionComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 22/05/24.
//

// 22 de Maio: 9 5 3 4
// 23 de Maio: 7 0 0 4


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
    
    @State private var date: Date = Date()
    
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
            Text("Itens da Missão")
            HStack {
                VStack{
                    Text("A: \(dailyMissionList.first?.dailyMission.missionItemAlpha ?? 0)")
                    Text("A: \(dailyMissionList.first?.itemAlpha ?? 0)")
                }
                VStack{
                    Text("B: \(dailyMissionList.first?.dailyMission.missionItemBravo ?? 0)")
                    Text("B: \(dailyMissionList.first?.itemBravo ?? 0)")
                }
                VStack{
                    Text("C: \(dailyMissionList.first?.dailyMission.missionItemCharlie ?? 0)")
                    Text("C: \(dailyMissionList.first?.itemCharlie ?? 0)")
                }
                VStack{
                    Text("D: \(dailyMissionList.first?.dailyMission.missionItemDelta ?? 0)")
                    Text("D: \(dailyMissionList.first?.itemDelta ?? 0)")
                }
            }
            .padding()
            
            Text("Itens do Inventário")
            
        }
        .onAppear(perform: generateNewMission)
    }
    
    func generateNewMission() {
            dailyMissionCurrent = DailyMission(
                missionDescription: missionDescriptions.randomElement() ?? "No mission today",
                missionItemAlpha: Int.random(in: 0...10),
                missionItemBravo: Int.random(in: 0...7),
                missionItemCharlie: Int.random(in: 0...5),
                missionItemDelta: Int.random(in: 1...4)
            )
            
            if let existingMission = dailyMissionList.first {
            // Update the existing mission
                if dateFormatter() != dailyMissionList.first?.date {
                    existingMission.dailyMission = dailyMissionCurrent
                    existingMission.date = dateFormatter()
                }
        } else {
            // Create a new mission if none exists
            let modelDailyMission = ModelNew(date: dateFormatter(), dailyMission: dailyMissionCurrent)
            context.insert(modelDailyMission)
        }
        
        // Save changes to the context
        try? context.save()
    
    }
    
    func dateFormatter() -> String{
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        
        let todaysDate = format.string(from: date)
        
        return todaysDate
    }
    
}
