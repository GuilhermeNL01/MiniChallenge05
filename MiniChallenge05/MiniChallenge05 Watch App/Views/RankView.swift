//
//  RankView.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 24/05/24.
//

import SwiftUI

struct RankView: View {
    var body: some View {
        ScrollView {
            VStack {
                IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: .blue)
                    .padding()
                IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: .blue)
                    .padding()
                IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: .pink)
                    .padding()
                IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: .orange)
                    .padding()
                IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: .red)
                    .padding()
            }
        }
    }

}

#Preview {
    RankView()
}
