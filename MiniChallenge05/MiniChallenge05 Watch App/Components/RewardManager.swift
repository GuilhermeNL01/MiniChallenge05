//
//  RewardManager.swift
//  MiniChallenge05 Watch App
//
//  Created by ChatGPT on 22/05/24.
//

import Foundation

class RewardManager {
    private var lastRewardDistances: [Double] = [0, 0, 0, 0]
    private var nextRewardDistances: [Double] = [500, 700, 1000, 1200]
    
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
        for index in 0..<nextRewardDistances.count {
            if distance >= nextRewardDistances[index] {
                lastRewardDistances[index] = nextRewardDistances[index]
                nextRewardDistances[index] += generateNextRewardDistance(for: index)
                
                // Incrementa o item correspondente no modelo
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
