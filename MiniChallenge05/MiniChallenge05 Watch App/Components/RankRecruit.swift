//
//  RankRecruit.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 27/05/24.
//

import SwiftUI

struct RankRecruit: View {
    var body: some View {
        VStack{
            Text("Agente Recruta")
                .bold()
            HStack {
                Spacer()
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .frame(width: 34, height: 34)
                Spacer()
                VStack {
                    Text("25 Missões")
                }
                Spacer()
            }
        }
        .padding(10)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    RankRecruit()
}
