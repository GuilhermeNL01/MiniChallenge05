//
//  RankSpecial.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 27/05/24.
//

import SwiftUI

struct RankSpecial: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.orange)
                .frame(width: 200, height: 60)
            HStack {
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .frame(width: 34, height: 34)
                VStack {
                    Text("Agente Especial")
                        .bold()
                    
                    Text("125 Missões")
                }
            }
        }
    }
}

#Preview {
    RankSpecial()
}
