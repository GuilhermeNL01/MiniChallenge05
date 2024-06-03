//
//  RewardManager.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 22/05/24.
//

import SwiftUI
import HealthKit
import SwiftData

/**]
 The `RewardManager` class is responsible for managing rewards based on the distance traveled.
 It tracks the next reward distances and updates the rewards accordingly.
 */
class RewardManager {

    // MARK: - Properties
    
    /// The model containing the data for rewards and distances.
    var model: ModelNew
    
    // MARK: - Initialization
    
    /**
     Initializes a new `RewardManager` with the provided model.
     
     - Parameter model: The model containing the reward and distance data.
     */
    init(model: ModelNew) {
        self.model = model
    }
    
    // MARK: - Private Methods
    
    /**
     Generates a new distance required for the next reward based on the given index.
     
     - Parameter index: The index of the reward.
     - Returns: A new distance value with some random variation.
     */
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
    
    // MARK: - Public Methods
    
    /**
     Checks if the given distance is sufficient to earn a reward and updates the model accordingly.
     
     - Parameter distance: The distance traveled.
     - Parameter completion: A closure called with a boolean indicating if a reward was earned.
     */
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
    
    /**
     Calculates the progress towards the next reward for a given item index based on the distance traveled.
     
     - Parameter index: The index of the reward item.
     - Parameter distance: The distance traveled.
     - Returns: The progress as a value between 0.0 and 1.0.
     */
    func progress(for index: Int, distance: Double) -> Double {
        let lastDistance = model.lastRewardDistances[index]
        let nextDistance = model.nextRewardDistances[index]
        return (distance - lastDistance) / (nextDistance - lastDistance)
    }
}
