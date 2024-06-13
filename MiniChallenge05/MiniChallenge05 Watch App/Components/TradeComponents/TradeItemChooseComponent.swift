//
//  TradeItemChooseComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI
import SwiftData

struct TradeItemChooseComponent: View {
    
    @Query private var inventory: [ModelNew]
    
    @Binding var counter: Int
    @Binding var secondItemQuantity: Int
    @Binding var itemChosen: String
    @Binding var itemPicked: String
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                if counter > inventoryChecker() {
                    if counter > 0 {
                        counter -= 1
                        secondItemQuantity = itemMultiplier()
                    }
                }
            } label: {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .foregroundStyle(Color(hex: ColorPalette.lightBlue))
                    .frame(width: Constants.itemWidth, height: Constants.itemHeight)
            }.buttonStyle(CustomButton())
            
            Spacer()
            
            FirstChoiceComponent(itemChosen: $itemChosen, itemQuantity: $counter, secondItemQuantity: $secondItemQuantity) // Pass the binding
            
            Spacer()
            
            Button {
                if counter > inventoryChecker() {
                    if counter < 99 {
                        counter += 1
                        secondItemQuantity = itemMultiplier()
                    }
                }
            } label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundStyle(Color(hex: ColorPalette.lightBlue))
                    .frame(width: Constants.itemWidth, height: Constants.itemHeight)
            }.buttonStyle(CustomButton())
            Spacer()
        }
    }
    
    public func itemMultiplier() -> Int {
        switch itemChosen {
        case "Binóculo":
            if itemPicked == "Camera" {
                return counter / 2
            }
            else if itemPicked == "Folder" {
                return counter / 4
            }
            else if itemPicked == "Hat" {
                return counter / 8
            }
        case "Camera":
            if itemPicked == "Binóculo" {
                return counter * 2
            }
            else if itemPicked == "Folder" {
                return counter / 2
            }
            else if itemPicked == "Hat" {
                return counter / 4
            }
        case "Folder":
            if itemPicked == "Binóculo" {
                return counter * 4
            }
            else if itemPicked == "Camera" {
                return counter * 2
            }
            else if itemPicked == "Hat" {
                return counter / 2
            }
        case "Hat":
            if itemPicked == "Binóculo" {
                return counter * 8
            }
            else if itemPicked == "Camera" {
                return counter * 4
            }
            else if itemPicked == "Folder" {
                return counter * 2
            }
        default:
            print(0)
        }

        return 0
    }
    
    public func inventoryChecker() -> Int {
        switch itemChosen {
        case "Binóculo":
            return inventory.first?.itemAlpha ?? 0
        case "Camera":
            return inventory.first?.itemBravo ?? 0
        case "Folder":
            return inventory.first?.itemCharlie ?? 0
        case "Hat":
            return inventory.first?.itemDelta ?? 0
        default:
            print(0)
        }
        
        return 0
    }
}

