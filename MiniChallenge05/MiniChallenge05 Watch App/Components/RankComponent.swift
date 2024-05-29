//
//  RankComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 24/05/24.
//

import SwiftUI
import SwiftData

struct RankComponent: View {
    
    var dataModel: [ModelNew]
    var body: some View {
        
        VStack {
            HStack{
                switch dataModel.first?.totalMissions ?? 0 {
                case 0..<25:
                    RankRecruit()
                case 26..<50:
                    RankNoob()
                case 51..<100:
                    RankTactical()
                case 100..<200:
                    RankSpecial()
                case 200...:
                    RankMaster()
                default:
                    Image(systemName: "person.2.slash.fill")
                }
            }
        }
    }
}

