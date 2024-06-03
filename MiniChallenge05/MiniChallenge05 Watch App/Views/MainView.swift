//
//  MainView.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 29/05/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    DailyMissionComponent()
                    InventoryComponent()
                    RewardCheckView()
                }
            }.navigationTitle("Missão Atual")
        }
    }
}

#Preview {
    MainView()
}
