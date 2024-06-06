//
//  FirstChoiceComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct FirstChoiceComponent: View {
    
    @State var presentPopup = false
    var itemQuantity: Int
    
    var body: some View {
        
        Button {
            presentPopup.toggle()
        } label: {
            VStack{
                Text("\(itemQuantity)")
            }
            .frame(width: 60)
            .padding(10)
            .background(Color(hex: ColorPalette.lightBlue).opacity(0.32))
            .clipShape(.rect(cornerRadius: Constants.componentCornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                    .stroke(Color(hex: ColorPalette.lightBlue), lineWidth: 2)
            }
        }
        .buttonStyle(CustomButton())
        .sheet(isPresented: $presentPopup) {
          SecondChoiceComponent()
        }
        
    }
}

#Preview {
    FirstChoiceComponent(itemQuantity: 1)
}
