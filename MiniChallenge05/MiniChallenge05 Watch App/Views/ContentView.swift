//
//  ContentView.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 17/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
            AgentProgressView()
        }
        .tabViewStyle(.automatic)
    }
}



