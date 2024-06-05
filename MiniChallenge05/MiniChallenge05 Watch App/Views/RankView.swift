//
//  RankView.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 24/05/24.
//

import SwiftUI
import SwiftData

struct RankView: View {
    
    @Query var dataModel: [ModelNew]
    
    var body: some View {
        
        
        ScrollView {
        
            VStack {
                switch dataModel.first?.totalMissions ?? 0 {
                case 0..<25:
                    IndividualRankComponent(image: "patente", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente2", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkGray), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente3", missionNumber: "100 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkGray), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente4", missionNumber: "200 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkGray), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente", missionNumber: "200+ Missões", agentRank: "Agente Mestre", color: Color(hex: ColorPalette.darkGray), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 26..<50:
                    IndividualRankComponent(image: "patente", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente2", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente3", missionNumber: "100 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkGray), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente4", missionNumber: "200 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkGray), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente", missionNumber: "200+ Missões", agentRank: "Agente Mestre", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 51..<100:
                    IndividualRankComponent(image: "patente", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente2", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente3", missionNumber: "100 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente4", missionNumber: "200 Missões", agentRank: "Agente Especial", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente", missionNumber: "200+ Missões", agentRank: "Agente Mestre", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 100..<200:
                    IndividualRankComponent(image: "patente", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente2", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente3", missionNumber: "100 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente4", missionNumber: "200 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente", missionNumber: "200+ Missões", agentRank: "Agente Mestre", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 200...:
                    IndividualRankComponent(image: "patente", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente2", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente3", missionNumber: "100 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente4", missionNumber: "200 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente", missionNumber: "200+ Missões", agentRank: "Agente Mestre", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                default:
                    IndividualRankComponent(image: "patente", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente2", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente3", missionNumber: "100 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente4", missionNumber: "200 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "patente", missionNumber: "200+ Missões", agentRank: "Agente Mestre", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                }
            }
            .navigationTitle("Patentes")
        }
    }
}

#Preview {
    RankView()
}
