//
//  FirstChoiceComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct FirstChoiceComponent: View {
    
    @State private var presentPopup = false
    @Binding var itemChosen: String // Use binding here
    var itemQuantity: Int
    
    var body: some View {
        
        Button {
            presentPopup.toggle()
        } label: {
            VStack {
                if itemChosen.isEmpty {
                    Image(systemName: "questionmark")
                } else {
                    HStack {
                        Image(itemChosen)
                            .resizable()
                            .frame(width: Constants.smallItemWidth, height: Constants.smallItemHeight)
                        Spacer()
                        Text(itemQuantity < 10 ? "0\(itemQuantity)" : "\(itemQuantity)")
                            .font(.title2)
                            .bold()
                    }
                }
            }
            .frame(width: 60, height: 25)
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
            FirstPopupComponent(itemChosen: $itemChosen) // Pass the binding here
        }
    }
}

#Preview {
    FirstChoiceComponent(itemChosen: .constant(""), itemQuantity: 1)
}
