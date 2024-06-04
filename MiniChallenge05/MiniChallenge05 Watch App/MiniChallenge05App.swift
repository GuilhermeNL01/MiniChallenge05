//
//  MiniChallenge05App.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 17/05/24.
//

import SwiftUI
import SwiftData

@main
struct MiniChallenge05_Watch_AppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ModelNew.self)
    }
}
