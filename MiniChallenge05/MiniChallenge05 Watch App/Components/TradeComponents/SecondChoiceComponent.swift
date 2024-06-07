//
//  SecondChoiceComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct SecondChoiceComponent: View {
    @State private var presentPopup = false
    @Binding var itemChosen: String
    @Binding var itemPicked: String 
    @Binding var itemQuantity: Int
    
    var body: some View {
        
        Button {
            presentPopup.toggle()
        } label: {
            VStack {
                if itemPicked.isEmpty {
                    Image(systemName: "questionmark")
                } else {
                    HStack {
                        Image(itemPicked)
                            .resizable()
                            .frame(width: Constants.smallItemWidth, height: Constants.smallItemHeight)
                        Spacer()
                        Text(itemQuantity < 10 ? "0\(itemQuantity)" : "\(itemQuantity)")
                            .font(.title2)
                            .bold()
                    }
                }
            }
            .frame(width: 60, height: 60)
            .padding(10)
            .background(Color(hex: ColorPalette.lightBlue).opacity(0.32))
            .clipShape(RoundedRectangle(cornerRadius: Constants.componentCornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                    .stroke(Color(hex: ColorPalette.lightBlue), lineWidth: 2)
            }
        }
        .buttonStyle(CustomButton())
        .sheet(isPresented: $presentPopup) {
            SecondPopupComponent(itemChosen: $itemChosen) // Pass the binding here
        }
    }
}



