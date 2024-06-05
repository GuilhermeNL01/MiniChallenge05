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

                InventoryItemComponent(image: "Binóculo", item: inventory.first?.itemAlpha ?? 0)
                
                Spacer()

                InventoryItemComponent(image: "Camera", item: inventory.first?.itemBravo ?? 0)
                
                Spacer()
                
                InventoryItemComponent(image: "Folder", item: inventory.first?.itemCharlie ?? 0)
                
                Spacer()
                
                InventoryItemComponent(image: "Hat", item: inventory.first?.itemDelta ?? 0)
                
                Spacer()
            }
        }
        .padding(4)
        .background(Color(hex: ColorPalette.darkBlue))
        .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    InventoryComponent()
}
