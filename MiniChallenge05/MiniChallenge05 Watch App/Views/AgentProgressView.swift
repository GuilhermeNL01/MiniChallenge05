//
//  AgentProgressView.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 29/05/24.
//

import SwiftUI

struct AgentProgressView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    RankComponent()
                        .padding(.vertical)
                    MissionCounterComponent()
                        .padding(.vertical)
                    TotalDistanceComponent()
                        .padding(.vertical)
                }
            }.navigationTitle("Meu Progresso")
        }
    }
}

#Preview {
    AgentProgressView()
}
