//
//  RankComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 24/05/24.
//

import SwiftUI
import SwiftData

struct RankComponent: View {
    
    @Query var dataModel: [ModelNew]
    var body: some View {
        
        VStack {
            HStack{
                switch dataModel.first?.totalMissions ?? 0 {
                case 0..<25:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: .blue)
                        .padding()
                case 26..<50:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: .blue)
                        .padding()
                case 51..<100:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: .pink)
                        .padding()
                case 100..<200:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: .orange)
                        .padding()
                case 200...:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: .red)
                        .padding()
                default:
                    Image(systemName: "person.2.slash.fill")
                }
            }
        }
    }
}
