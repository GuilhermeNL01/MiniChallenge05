//
//  ContentView.swift
//  MiniChallenge05 Watch App
//
//  Created by Guilherme Nunes Lobo on 17/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var dataModel: [ModelNew] = []
    
    var body: some View {
        
        NavigationStack{
            VStack {
                    RankComponent(dataModel: dataModel)
            }
            .padding()
            
        }
    }
}



