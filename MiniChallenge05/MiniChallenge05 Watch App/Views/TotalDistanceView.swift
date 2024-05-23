//
//  TotalDistanceView.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 23/05/24.
//

import SwiftUI
struct TotalDistanceView: View {
    @StateObject private var healthKitManager = HealthKitManager(model: ModelNew())
    @State private var totalDistance: Double = 0

    var body: some View {
        ScrollView {
            VStack {
                // Header
                HStack {
                    Image(systemName: "figure.walk")
                        .font(.title)
                    Text("Total Distance")
                        .font(.title)
                }
                .padding(.bottom)

                Text("\(totalDistance, specifier: "%.2f") km")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)

                Spacer()
            }
            .padding()
            .onAppear {
                fetchTotalDistance()
            }
        }
    }

    private func fetchTotalDistance() {
        healthKitManager.fetchTotalWalkingRunningDistance { distance in
            DispatchQueue.main.async {
                self.totalDistance = distance / 1000 // Convert meters to kilometers
            }
        }
    }
}

#Preview {
    TotalDistanceView()
}
