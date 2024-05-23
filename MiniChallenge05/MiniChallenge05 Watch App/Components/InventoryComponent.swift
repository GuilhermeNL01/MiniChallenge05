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
        HStack {
            VStack {
                HStack {
                    Text("Inventário")
                    
                    Spacer()
                }
                ForEach (inventory) { item in
                    
                    HStack {
                        HStack {
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(item.itemAlpha)")
                                .fontWidth(.compressed)
                                .font(.footnote)
                                .padding(.top)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(item.itemBravo)")
                                .fontWidth(.compressed)
                                .font(.footnote)
                                .padding(.top)
                        }
                        .padding(.horizontal)
                        
                        HStack {
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(item.itemCharlie)")
                                .fontWidth(.compressed)
                                .font(.footnote)
                                .padding(.top)
                        }
                        .padding(.horizontal)
                        
                        
                        HStack {
                            Image(systemName: "square.and.arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            VStack{
                                Text("\(item.itemDelta)")
                                    .fontWidth(.compressed)
                                    .font(.footnote)
                                    .padding(.top)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .background(.blue)
    }
}

#Preview {
    InventoryComponent()
}
