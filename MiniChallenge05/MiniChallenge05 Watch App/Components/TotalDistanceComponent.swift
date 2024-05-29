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
                    .font(.system(size: 30))
                VStack{
                    HStack{
                        Text("Total Percorrido")
                            .font(.callout)
                        Spacer()
                    }
                    HStack{
                        Text("0,\(Int(totalDistance * 10) % 10) KM")
                            .font(.system(size: 25, weight: .regular, design: .default))
                            .foregroundColor(.primary)
                        Spacer()
                    }
                }
            }
            .padding(.bottom)


            Spacer()
        }
        .padding()
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
