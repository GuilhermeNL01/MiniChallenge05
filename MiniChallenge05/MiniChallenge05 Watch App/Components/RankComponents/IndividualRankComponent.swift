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
    let maxValue: Int
    let currentValue: Int
    
    var body: some View {
        
        VStack {
            HStack{
                Text(agentRank)
                    .bold()
                    .fixedSize(horizontal: true, vertical: false)
                Spacer()
            }
            HStack {
                Spacer()
                
                Image(systemName: image)
                    .resizable()
                    .frame(width: 34, height: 34)
                
                Spacer()
                
                VStack {
                    
                    ProgressView(value: 5, total: 50)
                        .tint(Color(hex: ColorPalette.buttonBlue))
                    HStack{
                        Text(missionNumber)
                        Spacer()
                    }
                }
                
                Spacer()
            }
        }
        .padding()
        .background(color)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    IndividualRankComponent(image: "person.2.circle.fill", missionNumber: "215 Missões", agentRank: "Agente Especial", color: .red, maxValue: 50, currentValue: 37)
}
