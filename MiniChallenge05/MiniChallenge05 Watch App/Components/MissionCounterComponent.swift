//
//  MissionCounterComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 27/05/24.
//

import SwiftUI
import SwiftData

struct MissionCounterComponent: View {
    @Environment(\.modelContext) var context
    @Query var missionModel: [ModelNew]
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "pencil.tip.crop.circle")
                Text("\(missionModel.first?.totalMissions ?? 0) MISSÕES")
                Spacer()
            }
            HStack{
                Text("COMPLETADAS")
                    .font(.footnote)
                Spacer()
            }
            
        }.padding()
        
    }
}

#Preview {
    MissionCounterComponent()
}
