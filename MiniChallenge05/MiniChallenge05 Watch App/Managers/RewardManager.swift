//
//  RewardManager.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 22/05/24.
//


//
//  RewardManager.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 22/05/24.
//

import SwiftUI
import HealthKit
import SwiftData

class RewardManager {
    
    var model: ModelNew
    
    init(model: ModelNew) {
        self.model = model
    }
    
    // Gera uma nova distância para a próxima recompensa
    private func generateNextRewardDistance(for index: Int) -> Double {
        let baseDistance: Double
        switch index {
        case 0:
            baseDistance = 500
        case 1:
            baseDistance = 700
        case 2:
            baseDistance = 1000
        case 3:
            baseDistance = 1200
        default:
            baseDistance = 500
        }
        let variation = Double.random(in: 100...300)
        return baseDistance + variation
    }
    
    // Verifica se a distância percorrida atinge a próxima recompensa
    func checkForReward(with distance: Double, completion: @escaping (Bool) -> Void) {
        var rewarded = false
        for index in 0..<model.nextRewardDistances.count {
            if distance >= model.nextRewardDistances[index] {
                model.lastRewardDistances[index] = model.nextRewardDistances[index]
                model.nextRewardDistances[index] += generateNextRewardDistance(for: index)
                
                // Increment the corresponding item in the model
                switch index {
                case 0:
                    model.itemAlpha += 1
                case 1:
                    model.itemBravo += 1
                case 2:
                    model.itemCharlie += 1
                case 3:
                    model.itemDelta += 1
                default:
                    break
                }
                
                rewarded = true
            }
        }
        
        completion(rewarded)
    }
    
    // Calculate the progress for each item
    func progress(for index: Int, distance: Double) -> Double {
        let lastDistance = model.lastRewardDistances[index]
        let nextDistance = model.nextRewardDistances[index]
        return (distance - lastDistance) / (nextDistance - lastDistance)
    }
}


struct RewardCheckView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Query private var model: [ModelNew]
    
    @State private var rewardMessage: String = ""
    @State private var itemAlpha: Int = 0
    @State private var itemBravo: Int = 0
    @State private var itemCharlie: Int = 0
    @State private var itemDelta: Int = 0
    
    @State private var distance: Double = 0.0
    @State private var healthKitManager: HealthKitManager?
    @State private var progressAlpha: Double = 0.0
    @State private var progressBravo: Double = 0.0
    @State private var progressCharlie: Double = 0.0
    @State private var progressDelta: Double = 0.0

    var body: some View {
        ScrollView{
            VStack {
                VStack(spacing: 15) {
                    CircularProgressView(icon: "hare.fill", title: "Item 01", progress: progressAlpha, currentDistance: distance, totalDistance: model.first?.nextRewardDistances[0] ?? 50)
                    CircularProgressView(icon: "tortoise.fill", title: "Item 02", progress: progressBravo, currentDistance: distance, totalDistance: model.first?.nextRewardDistances[1] ?? 50)
                }
                .padding(.top, 50)
                
                VStack(spacing: 15) {
                    CircularProgressView(icon: "camera.fill", title: "Item 03", progress: progressCharlie, currentDistance: distance, totalDistance: model.first?.nextRewardDistances[2] ?? 50)
                    CircularProgressView(icon: "volleyball.fill", title: "Item 04", progress: progressDelta, currentDistance: distance, totalDistance: model.first?.nextRewardDistances[3] ?? 50)
                }
                .padding(.top, 20)
            }
            .background(Color.black)
            .onAppear {
                if model.isEmpty {
                    let newModel = ModelNew()
                    context.insert(newModel)
                    saveChanges()
                    healthKitManager = HealthKitManager(model: newModel)
                } else {
                    healthKitManager = HealthKitManager(model: model.first!)
                }
                
                healthKitManager?.requestAuthorization { success in
                    if success {
                        fetchAndCheckRewards()
                    } else {
                        print("HealthKit authorization failed")
                    }
                }
            }
        }
    }
    private func fetchAndCheckRewards() {
        healthKitManager?.fetchWalkingRunningDistance { distance in
            self.distance = distance
            healthKitManager?.rewardManager.checkForReward(with: distance) { rewarded in
                rewardMessage = rewarded ? "You've earned a reward!" : "No reward this time."
                itemAlpha = healthKitManager?.rewardManager.model.itemAlpha ?? 0
                itemBravo = healthKitManager?.rewardManager.model.itemBravo ?? 0
                itemCharlie = healthKitManager?.rewardManager.model.itemCharlie ?? 0
                itemDelta = healthKitManager?.rewardManager.model.itemDelta ?? 0
                
                progressAlpha = healthKitManager?.rewardManager.progress(for: 0, distance: distance) ?? 0.0
                progressBravo = healthKitManager?.rewardManager.progress(for: 1, distance: distance) ?? 0.0
                progressCharlie = healthKitManager?.rewardManager.progress(for: 2, distance: distance) ?? 0.0
                progressDelta = healthKitManager?.rewardManager.progress(for: 3, distance: distance) ?? 0.0
                
                saveChanges()
            }
        }
    }

    private func saveChanges() {
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
}
