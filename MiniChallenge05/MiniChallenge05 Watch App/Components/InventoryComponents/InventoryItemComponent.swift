//
//  InventoryItemComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 04/06/24.
//

import SwiftUI

struct InventoryItemComponent: View {
    // Parameters passed from DailyMissionComponent
    
    let image: String
    let item: Int
    
    var body: some View {
        VStack{
            Image(systemName: image)
                .resizable()
                .frame(width: Constants.itemWidth, height: Constants.itemHeight)
                Text("\(item)")
        }
    }
}

#Preview {
    InventoryItemComponent(image: "backpack.circle.fill", item: 0)
}
