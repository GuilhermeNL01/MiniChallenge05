//
//  IndividualRankComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

struct IndividualRankComponent: View {
    
    let image: String
    let missionNumber: String
    let agentRank: String
    let color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(color)
                .frame(width: 200, height: 60)
            HStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 34, height: 34)
                VStack {
                    Text(agentRank)
                        .bold()
                    
                    Text(missionNumber)
                }
            }
        }
    }
}

#Preview {
    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Mestre", color: .red)
}
