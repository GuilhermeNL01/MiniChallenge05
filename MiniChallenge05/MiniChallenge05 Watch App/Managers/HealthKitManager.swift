//
//  HealthKitManager.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 21/05/24.
//
import HealthKit

/**
 The `HealthKitManager` class is responsible for managing HealthKit interactions, including requesting authorization and fetching walking/running distance data
 */
class HealthKitManager: ObservableObject {
    // MARK: - Properties
    
    /// The HealthKit store used to access HealthKit data.
    let healthStore = HKHealthStore()
    
    /// The manager responsible for handling rewards based on distance.
    let rewardManager: RewardManager
    
    // MARK: - Initialization
    
    /**
     Initializes a new `HealthKitManager` with the provided model.
     
     - Parameter model: The model containing the reward and distance data.
     */
    init(model: ModelNew) {
        self.rewardManager = RewardManager(model: model)
        storeStartDateIfNeeded()
    }
    
    // MARK: - Private Methods
    
    /**
     Stores the start date in `UserDefaults` if it hasn't been stored already.
     */
    private func storeStartDateIfNeeded() {
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "startDate") == nil {
            userDefaults.set(Date(), forKey: "startDate")
        }
    }
    
    // MARK: - Public Methods
    
    /**
     Requests authorization to access HealthKit data.
     
     - Parameter completion: A closure called with a boolean indicating if authorization was successful.
     */
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
    
    /**
     Fetches the total walking/running distance for the current day.
     
     - Parameter completion: A closure called with the total distance in meters.
     */
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
                completion(distance)
            }
        }
        
        healthStore.execute(query)
    }
    
    /**
     Fetches the total walking/running distance since the beginning of recorded data.
     
     - Parameter completion: A closure called with the total distance in meters.
     */
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
