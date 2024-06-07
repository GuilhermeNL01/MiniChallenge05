//
//  TradeItemChooseComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct TradeItemChooseComponent: View {
    
    @State var counter: Int = 0
    
    var body: some View {
        HStack{
            Spacer()
            Button {
                if counter > 0 {
                    counter -= 1
                }
            } label: {
                Image(systemName: "minus.circle.fill")
                    .resizable()
                    .foregroundStyle(Color(hex: ColorPalette.lightBlue))
                    .frame(width: Constants.itemWidth, height: Constants.itemHeight)
            }.buttonStyle(CustomButton())
            
            Spacer()
            
            FirstChoiceComponent(itemQuantity: counter)
            
            Spacer()
            
            Button {
                if counter < 99 {
                    counter += 1
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
}

#Preview {
    TradeItemChooseComponent()
}
