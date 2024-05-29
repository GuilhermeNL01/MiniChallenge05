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
        HStack{
            Image(.spy)
                .resizable()
                .frame(width: 53.91, height: 42)
            VStack{
                HStack{
                    Text("Missões Completadas")
                        .font(.callout.bold())
                    Spacer()
                }
                .padding(.bottom)
                HStack{
                    Text("\(missionModel.first?.totalMissions ?? 0) Missões")
                        .font(.footnote)
                    Spacer()
                }
                
            }.padding(.leading, 3)
            
        }.padding()
    }
}

#Preview {
    MissionCounterComponent()
}
