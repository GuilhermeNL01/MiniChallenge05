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

// Struct defining basic Daily Mission properties
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
    @Environment(\.scenePhase) var scenePhase
    
    @State private var dailyMissionCurrent: DailyMission = DailyMission(
        missionDescription: "",
        missionItemAlpha: 0,
        missionItemBravo: 0,
        missionItemCharlie: 0,
        missionItemDelta: 0
    )
    
    @State private var date: Date = Date()
    
    // Descriptions for the Daily Mission Component. NOT CURRENTLY USED
    private let missionDescriptions = [
        "Collect 10 apples",
        "Defeat 5 enemies",
        "Find the hidden treasure",
        "Complete the puzzle"
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Missão do Dia")
                    .padding(.leading, 15)
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .padding(.bottom)
             
            // Mission Items
            HStack {
                Spacer()
                
                DailyMissionItemComponent(image: "graduationcap.circle.fill", missionItem: dailyMissionList.first?.dailyMission.missionItemAlpha ?? 0, currentItem: dailyMissionList.first?.itemAlpha ?? 0, missionCompletion: ((dailyMissionList.first?.missionCompletion) != nil))
                
                Spacer()
                
                DailyMissionItemComponent(image: "backpack.circle.fill", missionItem: dailyMissionList.first?.dailyMission.missionItemBravo ?? 0, currentItem: dailyMissionList.first?.itemBravo ?? 0, missionCompletion: ((dailyMissionList.first?.missionCompletion) != nil))
                
                Spacer()
                
                DailyMissionItemComponent(image: "paperclip.circle.fill", missionItem: dailyMissionList.first?.dailyMission.missionItemCharlie ?? 0, currentItem: dailyMissionList.first?.itemCharlie ?? 0, missionCompletion: ((dailyMissionList.first?.missionCompletion) != nil))
                
                Spacer()
                
                DailyMissionItemComponent(image: "person.2.circle.fill", missionItem: dailyMissionList.first?.dailyMission.missionItemDelta ?? 0, currentItem: dailyMissionList.first?.itemDelta ?? 0, missionCompletion: ((dailyMissionList.first?.missionCompletion) != nil))
                
                Spacer()
            }
            // Inventory Items
            
        }
        .onAppear(perform: generateNewMission)
        .onChange(of: scenePhase) { oldPhase, newPhase in
            if newPhase == .active {
                generateNewMission()
            } else if newPhase == .inactive {
                generateNewMission()
            } else if newPhase == .background {
                generateNewMission()
            }
        }
        .padding(4)
        .background(Color(hex: ColorPalette.darkBlue))
        .clipShape(.rect(cornerRadius: 20))
    }
    
    func generateNewMission() {
            dailyMissionCurrent = DailyMission(
                missionDescription: missionDescriptions.randomElement() ?? "No mission today", // Isn't currently used
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
                    existingMission.missionCompletion = false
                }
        } else {
            // Create a new mission if none exists
            let modelDailyMission = ModelNew(date: dateFormatter(), dailyMission: dailyMissionCurrent)
            context.insert(modelDailyMission)
        }
        
        // Save changes to the context
        try? context.save()
        
        completeMission()
    
    }
    
    func dateFormatter() -> String{
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        
        let todaysDate = format.string(from: date)
        
        return todaysDate
    }
    
    func completeMission() {
        if let existingMission = dailyMissionList.first {
            if existingMission.missionCompletion == false {
                // Update the existing mission
                if existingMission.itemAlpha >= existingMission.dailyMission.missionItemAlpha &&
                    existingMission.itemBravo >= existingMission.dailyMission.missionItemBravo &&
                    existingMission.itemCharlie >= existingMission.dailyMission.missionItemCharlie &&
                    existingMission.itemDelta >= existingMission.dailyMission.missionItemDelta {
                    
                    // Remove items from inventory once all necessary mission items are acquired
                    existingMission.itemAlpha -= existingMission.dailyMission.missionItemAlpha
                    existingMission.itemBravo -= existingMission.dailyMission.missionItemBravo
                    existingMission.itemCharlie -= existingMission.dailyMission.missionItemCharlie
                    existingMission.itemDelta -= existingMission.dailyMission.missionItemDelta
                    
                    // Increment the total mission counter for the rank logic
                    existingMission.totalMissions += 1
                    
                    // Mark the mision as completed
                    existingMission.missionCompletion = true
                }
                
                try? context.save()
            }
        }
    }
    
}
