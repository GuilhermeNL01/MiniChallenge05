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
                Text("Inventário")
                    .padding(.leading, 15)
                    .font(.title3)
                    .bold()
                Spacer()
            }
            .padding(.bottom)
            
            
            HStack{
                Spacer()
                VStack {
                    Image(systemName: "graduationcap.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                Spacer()
                
                VStack {
                    Image(systemName: "backpack.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                Spacer()
                
                VStack {
                    Image(systemName: "paperclip.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                Spacer()
                
                VStack {
                    Image(systemName: "person.2.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("\(inventory.first?.itemAlpha ?? 0)")
                }
                Spacer()
            }
        }
        .padding(4)
        .background(.blue)
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    InventoryComponent()
}
