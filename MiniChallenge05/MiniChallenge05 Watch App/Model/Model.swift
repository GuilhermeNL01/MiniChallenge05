//
//  Model.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 20/05/24.
//

import Foundation
import SwiftData

@Model
public class ModelNew {
    var itemAlpha: Int
    var itemBravo: Int
    var itemCharlie: Int
    var itemDelta: Int
    var totalSteps: Int
    var dailySteps: Int
    var totalItems: Int
    var totalMissions: Int
    var dailyMission: DailyMission
    
    init(itemAlpha: Int = 0, itemBravo: Int = 0, itemCharlie: Int = 0, itemDelta: Int = 0, totalSteps: Int = 0, dailySteps: Int = 0, totalItems: Int = 0, totalMissions: Int = 0, dailyMission: DailyMission) {
        self.itemAlpha = itemAlpha
        self.itemBravo = itemBravo
        self.itemCharlie = itemCharlie
        self.itemDelta = itemDelta
        self.totalSteps = totalSteps
        self.dailySteps = dailySteps
        self.totalItems = totalItems
        self.totalMissions = totalMissions
        self.dailyMission = dailyMission
    }
}
