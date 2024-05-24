//
//  InventoryComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by GABRIEL Ferreira Cardoso on 23/05/24.
//

import SwiftUI
import SwiftData

struct InventoryComponent: View {
    
    @Query private var inventory: [ModelNew]
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Missão do Dia")
                    .font(.title3)
                    .bold()
                Spacer()
            }
            
            HStack{
                VStack {
                    Image(systemName: "graduationcap.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                .padding(.horizontal)
                
                VStack {
                    Image(systemName: "backpack.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                .padding(.horizontal)
                
                VStack {
                    Image(systemName: "paperclip.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                .padding(.horizontal)
                
                VStack {
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    InventoryComponent()
}
