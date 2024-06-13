//
//  TradeButtonComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 13/06/24.
//

import SwiftUI
import SwiftData

struct TradeButtonComponent: View {
    
    @Environment(\.modelContext) var context
    @Query private var inventory: [ModelNew]
    
    @Binding var itemQuantity: Int
    @Binding var secondItemQuantity: Int
    
    @Binding var itemChosen: String
    @Binding var itemPicked: String
    
    var body: some View {
        VStack {
            Button {
                trade()
                itemQuantity = 0
                secondItemQuantity = 0
                itemChosen = ""
                itemPicked = ""
            } label: {
                Text("Trocar Item")
                    .font(.system(size: Constants.componentTitle))
                    .padding(4)
                    .frame(width: Constants.componentWidth-15, height: Constants.componentSquare)
                    .background(Color(hex: ColorPalette.lightBlue))
                    .clipShape(.rect(cornerRadius: 44))

            }.buttonStyle(CustomButton())
        }
    }
    
    public func trade() {
        if let existingTrade = inventory.first {
                    
            if itemChosen == "Binóculo" {
                existingTrade.itemAlpha -= itemQuantity
                if itemPicked == "Camera" {
                    existingTrade.itemBravo += secondItemQuantity
                } else if itemPicked == "Folder" {
                    existingTrade.itemCharlie += secondItemQuantity
                } else if itemPicked == "Hat" {
                    existingTrade.itemDelta += secondItemQuantity
                }
            }
            if itemChosen == "Camera" {
                existingTrade.itemBravo -= itemQuantity
                if itemPicked == "Binóculo" {
                    existingTrade.itemAlpha += secondItemQuantity
                } else if itemPicked == "Folder" {
                    existingTrade.itemCharlie += secondItemQuantity
                } else if itemPicked == "Hat" {
                    existingTrade.itemDelta += secondItemQuantity
                }
            }
            if itemChosen == "Folder" {
                existingTrade.itemCharlie -= itemQuantity
                if itemPicked == "Binóculo" {
                    existingTrade.itemAlpha += secondItemQuantity
                } else if itemPicked == "Camera" {
                    existingTrade.itemBravo += secondItemQuantity
                } else if itemPicked == "Hat" {
                    existingTrade.itemDelta += secondItemQuantity
                }
            }
            if itemChosen == "Hat" {
                existingTrade.itemDelta -= itemQuantity
                if itemPicked == "Binóculo" {
                    existingTrade.itemAlpha += secondItemQuantity
                } else if itemPicked == "Camera" {
                    existingTrade.itemBravo += secondItemQuantity
                } else if itemPicked == "Folder" {
                    existingTrade.itemCharlie += secondItemQuantity
                }
            }
                
            try? context.save()
            
        }
    }
    
}

