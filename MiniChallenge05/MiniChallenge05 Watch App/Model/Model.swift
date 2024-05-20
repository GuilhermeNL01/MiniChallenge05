//
//  Model.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 20/05/24.
//

import Foundation
import SwiftData

@Model
public class Model {
    @Published var itemAlpha: Int
    @Published var itemBravo: Int
    @Published var itemCharlie: Int
    @Published var itemDelta: Int
    @Published var totalSteps: Int
    @Published var dailySteps: Int
    @Published var totalItems: Int
    @Published var totalMissions: Int
    
    init(itemAlpha: Int = 0, itemBravo: Int = 0, itemCharlie: Int = 0, itemDelta: Int = 0, totalSteps: Int = 0, dailySteps: Int = 0, totalItems: Int = 0, totalMissions: Int = 0) {
        self.itemAlpha = itemAlpha
        self.itemBravo = itemBravo
        self.itemCharlie = itemCharlie
        self.itemDelta = itemDelta
        self.totalSteps = totalSteps
        self.dailySteps = dailySteps
        self.totalItems = totalItems
        self.totalMissions = totalMissions
    }
}
