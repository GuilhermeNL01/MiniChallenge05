//
//  RewardManager.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 22/05/24.
//

import SwiftUI
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
}
struct RewardCheckView: View {
    @Environment(\.modelContext) private var context: ModelContext
    @Query private var model: [ModelNew]

    @State private var rewardMessage: String = ""
    private let predefinedDistance: Double = 4000
    
    private var rewardManager: RewardManager {
        RewardManager(model: model.first ?? ModelNew())
    }

    var body: some View {
        VStack {
            Button("Check for Reward") {
                rewardManager.checkForReward(with: predefinedDistance) { rewarded in
                    rewardMessage = rewarded ? "You've earned a reward!" : "No reward this time."
                    saveChanges()
                }
            }
            .padding()
            
            Text(rewardMessage)
                .padding()
            
            VStack {
                Text("Rewards Summary")
                    .font(.headline)
                Text("Item Alpha: \(rewardManager.model.itemAlpha)")
                Text("Item Bravo: \(rewardManager.model.itemBravo)")
                Text("Item Charlie: \(rewardManager.model.itemCharlie)")
                Text("Item Delta: \(rewardManager.model.itemDelta)")
            }
            .padding()
        }
        .padding()
        .onAppear {
            if model.isEmpty {
                let newModel = ModelNew()
                context.insert(newModel)
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
