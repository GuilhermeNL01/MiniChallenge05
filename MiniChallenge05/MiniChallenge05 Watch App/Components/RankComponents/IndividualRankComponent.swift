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
        
        HStack {
            Spacer()
            
            Image(systemName: image)
                .resizable()
                .frame(width: 34, height: 34)
            
            Spacer()
            
            VStack {
                Text(agentRank)
                    .bold()
                    .fixedSize(horizontal: true, vertical: false)
                
                Text(missionNumber)
            }
            
            Spacer()
        }
        .padding()
        .background(color)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Especial", color: .red)
}
