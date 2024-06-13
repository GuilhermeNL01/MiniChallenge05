//
//  InventoryView.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI
import SwiftData

struct InventoryView: View {
    
    @Environment(\.modelContext) var context
    @Query var model: [ModelNew]
    
    @State private var tradeItemQuantity: Int = 0
    @State private var secondItemQuantity: Int = 0
    @State private var itemChosen: String = "" 
    @State private var itemPicked: String = ""
    
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
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    HStack {
                        Spacer()
                        VStack{
                            SoloCircularProgressComponent(icon: "Binóculo2", progress: progressAlpha, progressColor: Color(hex: ColorPalette.lightOrange), itemQuantity: model.first?.itemAlpha ?? 0)
                        }
                        Spacer()
                        VStack{
                            SoloCircularProgressComponent(icon: "Camera2", progress: progressBravo, progressColor: Color(hex: ColorPalette.lightGreen), itemQuantity: model.first?.itemBravo ?? 0)
                        }
                        Spacer()
                        VStack{
                            SoloCircularProgressComponent(icon: "Folder2", progress: progressCharlie, progressColor: Color(hex: ColorPalette.lightYellow), itemQuantity: model.first?.itemCharlie ?? 0)
                        }
                        Spacer()
                        VStack{
                            SoloCircularProgressComponent(icon: "Hat2", progress: progressDelta, progressColor: Color(hex: ColorPalette.lightPink), itemQuantity: model.first?.itemDelta ?? 0)
                        }
                        Spacer()
                    }
                    .padding(.bottom)
                    
                    HStack{
                        Text("Troca de itens")
                            .font(.system(size: Constants.componentTitle))
                            .bold()
                        Spacer()
                    }
                    HStack{
                        Text("Selecione o item necessário")
                            .font(.system(size: Constants.componentFootnote))
                        Spacer()
                    }
                    
                    TradeItemChooseComponent(counter: $tradeItemQuantity, secondItemQuantity: $secondItemQuantity, itemChosen: $itemChosen, itemPicked: $itemPicked)
                        .padding(.vertical)
                                        
                    Image(systemName: "arrow.down")
                        .resizable()
                        .frame(width: Constants.smallItemWidth ,height: Constants.smallItemHeight)
                        .padding(.bottom)
                          
                    Spacer()
                    
                    SecondChoiceComponent(itemChosen: $itemChosen, itemPicked: $itemPicked, secondItemQuantity: $secondItemQuantity, itemQuantity: $tradeItemQuantity) // Pass the binding
                        .padding(.bottom)
                    
                    Spacer()
                    
                    TradeButtonComponent(itemQuantity: $tradeItemQuantity, secondItemQuantity: $secondItemQuantity, itemChosen: $itemChosen, itemPicked: $itemPicked)
                    
                }
            }.navigationTitle("Inventário")
            .onAppear {
                setupHealthKitManager()
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Authorization Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // MARK: - Private Methods
    
    /**
     Sets up the HealthKit manager and requests authorization.
     */
    private func setupHealthKitManager() {
        if model.isEmpty {
            let newModel = ModelNew()
            context.insert(newModel)
            saveChanges()
            healthKitManager = HealthKitManager(model: newModel)
        } else {
            healthKitManager = HealthKitManager(model: model.first!)
        }
        
        healthKitManager?.requestAuthorization { success in
            DispatchQueue.main.async {
                if success {
                    fetchAndCheckRewards()
                } else {
                    handleAuthorizationFailure()
                }
            }
        }
    }
    
    /**
     Fetches distance data from HealthKit and checks for rewards.
     */
    private func fetchAndCheckRewards() {
        healthKitManager?.fetchWalkingRunningDistance { distance in
            self.distance = distance
            healthKitManager?.rewardManager.checkForReward(with: distance) { rewarded in
                itemAlpha = healthKitManager?.rewardManager.model.itemAlpha ?? 0
                itemBravo = healthKitManager?.rewardManager.model.itemBravo ?? 0
                itemCharlie = healthKitManager?.rewardManager.model.itemCharlie ?? 0
                itemDelta = healthKitManager?.rewardManager.model.itemDelta ?? 0
                
                updateProgress()
                saveChanges()
            }
        }
    }
    
    /**
     Updates progress values based on the fetched distance data.
     */
    private func updateProgress() {
        guard let model = model.first else { return }
        progressAlpha = calculateProgress(for: 0, distance: distance, nextRewardDistance: model.nextRewardDistances[0])
        progressBravo = calculateProgress(for: 1, distance: distance, nextRewardDistance: model.nextRewardDistances[1])
        progressCharlie = calculateProgress(for: 2, distance: distance, nextRewardDistance: model.nextRewardDistances[2])
        progressDelta = calculateProgress(for: 3, distance: distance, nextRewardDistance: model.nextRewardDistances[3])
    }
    
    /**
     Calculates progress for a specific item.
     
     - Parameter index: The index of the reward item.
     - Parameter distance: The current distance traveled.
     - Parameter nextRewardDistance: The distance required for the next reward.
     - Returns: The progress as a value between 0.0 and 1.0.
     */
    private func calculateProgress(for index: Int, distance: Double, nextRewardDistance: Double) -> Double {
        let lastRewardDistance = model.first?.lastRewardDistances[index] ?? 0.0
        return (distance - lastRewardDistance) / (nextRewardDistance - lastRewardDistance)
    }
    
    /**
     Handles failure of HealthKit authorization by showing an alert with a specific message.
     */
    
    private func handleAuthorizationFailure() {
        alertMessage = "HealthKit authorization failed. Please enable HealthKit permissions in the Settings app."
        showAlert = true
    }
    
    /**
     Saves changes made to the model context and handles any errors that occur during the save operation.
     */
    private func saveChanges() {
        do {
            try context.save()
            
        } catch {
            handleSaveError(error)
        }
    }
    
    /**
     Handles errors that occur during the save operation.
     
     - Parameter error: The error that occurred during the save operation.
     */
    private func handleSaveError(_ error: Error) {
        
        alertMessage = "An error occurred while saving data. Please try again."
        showAlert = true
    }
    
}

#Preview {
    InventoryView()
}
