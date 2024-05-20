//
//  Model.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 20/05/24.
//

import Foundation
import SwiftData

@Model
public class ModelTest {
    
    var totalSteps: Int
    var dailySteps: Int
    var inventoryItems: [Int]
    var totalItems: [Int]
    var totalMissions: Int
    
    init(totalSteps: Int = 0, dailySteps: Int = 0, inventoryItems: [Int] = [0, 0, 0, 0], totalItems: [Int] = [0, 0, 0, 0], totalMissions: Int = 0) {
        self.totalSteps = totalSteps
        self.dailySteps = dailySteps
        self.inventoryItems = inventoryItems
        self.totalItems = totalItems
        self.totalMissions = totalMissions
    }
}

