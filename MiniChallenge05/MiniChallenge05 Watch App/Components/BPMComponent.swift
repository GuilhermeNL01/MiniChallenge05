//
//  BPMComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 20/05/24.
//

import SwiftUI
import HealthKit

struct BPMComponent: View {
    
    private var healthStore = HKHealthStore()
    let heartRateQuantity = HKUnit(from: "count/min")
    
    @State private var value = 0
    
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
                .foregroundColor(Color(hex: ColorPalette.buttonBlue))
                .font(.system(size: 30))
            Spacer()
            VStack {
                HStack {
                    Text("Média Cardíaca")
                        .font(.system(size: Constants.componentTitle, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                HStack(alignment: .lastTextBaseline, spacing: 2) {
                    Text("\(value)")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                    
                    Text("BPM/Missão")
                        .fontWeight(.regular)
                        .font(.system(size: 15))
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(width: Constants.componentWidth)
        .padding(.all, 10)
        .background(Color(hex: ColorPalette.darkBlue))
        .cornerRadius(Constants.componentCornerRadius)
        .onAppear(perform: start)
           
       }
    
    func start() {
        autorizeHealthKit()
        startHeartRateQuery(quantityTypeIdentifier: .heartRate)
    }
    
    func autorizeHealthKit() {
        let healthKitTypes: Set = [
        HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!]

        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
    }
    
    private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
        guard let samples = samples as? [HKQuantitySample] else {
            return
        }
            
        self.process(samples, type: quantityTypeIdentifier)

        }
        
        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        healthStore.execute(query)
    }
    
    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
        var lastHeartRate = 0.0
        
        for sample in samples {
            if type == .heartRate {
                lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
            }
            
            self.value = Int(lastHeartRate)
        }
    }
}

#Preview{
    BPMComponent()
}
