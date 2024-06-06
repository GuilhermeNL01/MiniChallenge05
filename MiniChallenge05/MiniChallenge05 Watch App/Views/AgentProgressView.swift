//
//  AgentProgressView.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 29/05/24.
//

import SwiftUI

struct AgentProgressView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    NavigationLink {
                        RankView()
                    } label: {
                        RankComponent()
                    }.buttonStyle(CustomButton())

                    MissionCounterComponent()
                        .padding(.vertical)
                    TotalDistanceComponent()
                        .padding(.vertical)
                    BPMComponent()
                        .padding(.vertical)
                }
            }.navigationTitle("Meu Progresso")
        }
    }
}

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color(red: 0, green: 0, blue: 0))
    }
}

#Preview {
    AgentProgressView()
}
