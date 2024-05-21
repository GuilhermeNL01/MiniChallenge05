//
//  DistanceView.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 21/05/24.
//

import SwiftUI

struct DistanceView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if let distance = viewModel.distance {
                Text("Você andou \(distance, specifier: "%.2f") metros hoje")
                ProgressBar(value: viewModel.progressPercentage, progressText: "\(Int(viewModel.distance ?? 0))/\(Int(viewModel.dailyGoal)) metros")
            } else {
                ProgressView("Carregando...")
            }
        }
        .onAppear {
            viewModel.requestAuthorization()
        }
    }
}

struct ProgressBar: View {
    var value: Double
    var progressText: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width, height: 20)
                
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: min(CGFloat(value) * geometry.size.width, geometry.size.width), height: 20)
                    .overlay(Text(progressText)
                                .foregroundColor(.white)
                                .padding(5))
            }
        }
        .cornerRadius(5.0)
        .padding(.vertical, 5)
    }
}

class ContentViewModel: ObservableObject {
    @Published var distance: Double?
    private var healthKitManager = HealthKitManager()
    let dailyGoal: Double = 1000 // Definindo a meta diária para 1000 metros (altere conforme necessário)
    
    var progressPercentage: Double {
        if let distance = distance {
            return min(distance / dailyGoal, 1.0)
        } else {
            return 0
        }
    }
    
    func requestAuthorization() {
        healthKitManager.requestAuthorization { success in
            if success {
                self.fetchDistance()
            } else {
            }
        }
    }
    
    private func fetchDistance() {
        healthKitManager.fetchWalkingRunningDistance { distance in
            self.distance = distance
        }
    }
}

#Preview {
    DistanceView()
}
