//
//  AgentProgressView.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 29/05/24.
//

import SwiftUI

struct AgentProgressView: View {
    var body: some View {
        VStack {
            RankComponent()
            MissionCounterComponent()
            TotalDistanceComponent()
        }
    }
}

#Preview {
    AgentProgressView()
}
