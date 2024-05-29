//
//  RankRecruit.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 27/05/24.
//

import SwiftUI

struct RankRecruit: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
            HStack {
                Image(systemName: "person.2.circle.fill")
                VStack {
                    Text("Agente Recruta")
                    Text("25 Missões")
                }
            }
        }
    }
}

#Preview {
    RankRecruit()
}
