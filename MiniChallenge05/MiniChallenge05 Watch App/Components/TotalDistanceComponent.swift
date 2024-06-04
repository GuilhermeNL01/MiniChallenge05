//
//  TotalDistanceView.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 23/05/24.
//

import SwiftUI

struct TotalDistanceComponent: View {
    @StateObject private var healthKitManager = HealthKitManager(model: ModelNew())
    @State private var totalDistance: Double = 0

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "figure.walk")
                    .font(.system(size: 50))
                    .foregroundColor(.blue)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Total Caminhado")
                        .font(.system(size: 15,weight: .bold))
                        .foregroundColor(.white)
                    Text("\(Int(totalDistance * 10) % 10) KM")
                        .font(.system(size: 15, weight: .regular, design: .default))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(.all)
        }
        .background(Color(hex: ColorPalette.darkBlue))
        .cornerRadius(10)
        .padding(.all, 10)
        .onAppear {
            fetchTotalDistance()
        }
    }

    private func fetchTotalDistance() {
        healthKitManager.fetchTotalWalkingRunningDistance { distance in
            DispatchQueue.main.async {
                self.totalDistance = distance / 1000
            }
        }
    }
}

#Preview {
    TotalDistanceComponent()
}
