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
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkGray), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkGray), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkGray), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: Color(hex: ColorPalette.darkGray), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 26..<50:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkGray), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkGray), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 51..<100:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 100..<200:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: .gray, maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                case 200...:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                default:
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "25 Missões", agentRank: "Agente Recruta", color: Color(hex: ColorPalette.darkBlue), maxValue: 25, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "50 Missões", agentRank: "Agente Novato", color: Color(hex: ColorPalette.darkBlue), maxValue: 50, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "75 Missões", agentRank: "Agente Tático", color: Color(hex: ColorPalette.darkBlue), maxValue: 100, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "125 Missões", agentRank: "Agente Especial", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
                        .padding()
                    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: Color(hex: ColorPalette.darkBlue), maxValue: 200, currentValue: dataModel.first?.totalMissions ?? 0)
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
