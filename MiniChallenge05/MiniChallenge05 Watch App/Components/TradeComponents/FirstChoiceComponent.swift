//
//  FirstChoiceComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct FirstChoiceComponent: View {
    
    @State private var presentPopup = false
    @State private var itemChosen: String = ""
    var itemQuantity: Int
    
    var body: some View {
        
        Button {
            presentPopup.toggle()
        } label: {
            VStack{
                if itemChosen == "" {
                    Image(systemName: "questionmark")
                } else {
                    Image(itemChosen)
                        .resizable()
                        .frame(width: Constants.itemWidth, height: Constants.itemHeight)
                }
//                Text("\(itemQuantity)")
            }
            .frame(width: 60)
            .padding(10)
            .background(Color(hex: ColorPalette.lightBlue).opacity(0.32))
            .clipShape(RoundedRectangle(cornerRadius: Constants.componentCornerRadius)) // Fixed the clipShape
            .overlay {
                RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                    .stroke(Color(hex: ColorPalette.lightBlue), lineWidth: 2)
            }
        }
        .buttonStyle(CustomButton())
        .sheet(isPresented: $presentPopup) {
            FirstPopupComponent(itemChosen: $itemChosen) // Pass the binding here
        }
        
    }
}

#Preview {
    FirstChoiceComponent(itemQuantity: 1)
}
