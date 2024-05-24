//
//  HealthKitManager.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 21/05/24.
//
import HealthKit

class HealthKitManager: ObservableObject {
    let healthStore = HKHealthStore()
    let rewardManager: RewardManager
    
    init(model: ModelNew) {
        self.rewardManager = RewardManager(model: model)
        storeStartDateIfNeeded()
    }
    
    func storeStartDateIfNeeded() {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "startDate") == nil {
            userDefaults.set(Date(), forKey: "startDate")
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let distanceType = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning) else {
            completion(false)
            return
        }
        
        let typesToShare: Set<HKSampleType> = []
        let typesToRead: Set<HKObjectType> = [distanceType]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { success, error in
            completion(success)
        }
    }
    
    func fetchWalkingRunningDistance(completion: @escaping (Double) -> Void) {
        guard let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning) else {
            completion(0.0)
            return
        }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            var distance: Double = 0
            
            if let result = result, let sum = result.sumQuantity() {
                distance = sum.doubleValue(for: HKUnit.meter())
            }
            
            DispatchQueue.main.async {
                print("Distância percorrida: \(distance) metros")
                self.rewardManager.checkForReward(with: distance) { rewarded in
                    if rewarded {
                        print("Usuário recebeu um item!")
                    }
                }
                completion(distance)
            }
        }
        
        healthStore.execute(query)
    }
    
    func fetchTotalWalkingRunningDistance(completion: @escaping (Double) -> Void) {
        guard let distanceType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning) else {
            completion(0.0)
            return
        }

        let startDate = Date.distantPast 
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)

        let query = HKStatisticsQuery(quantityType: distanceType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, error in
            var totalDistance: Double = 0
            
            if let result = result, let sum = result.sumQuantity() {
                totalDistance = sum.doubleValue(for: HKUnit.meter())
            }
            
            DispatchQueue.main.async {
                print("Distância total percorrida desde o início: \(totalDistance) metros")
                completion(totalDistance)
            }
        }

        healthStore.execute(query)
    }
}
