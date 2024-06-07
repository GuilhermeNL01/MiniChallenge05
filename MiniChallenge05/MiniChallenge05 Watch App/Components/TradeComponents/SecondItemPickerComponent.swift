//
//  SecondItemPickerComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 07/06/24.
//

import SwiftUI

struct SecondItemPickerComponent: View {
    var image: String
    var pressed: Bool
    var chosen: Bool
    
    var body: some View {
        ZStack {
            if !chosen {
                if !pressed {
                    RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                        .frame(width: Constants.componentSquare, height: Constants.componentSquare)
                        .foregroundStyle(Color(hex: ColorPalette.lightBlue).opacity(0.32))
                        .clipShape(.rect(cornerRadius: Constants.componentCornerRadius))
                        .overlay {
                            RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                                .stroke(Color(hex: ColorPalette.lightBlue), lineWidth: 2)
                        }
                } else {
                    RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                        .frame(width: Constants.componentSquare, height: Constants.componentSquare)
                        .foregroundStyle(Color(hex: ColorPalette.darkBlue).opacity(0.8))
                        .clipShape(.rect(cornerRadius: Constants.componentCornerRadius))
                        .overlay {
                            RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                                .stroke(Color(hex: ColorPalette.lightBlue), lineWidth: 2)
                        }
                }
            } else {
                RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                    .frame(width: Constants.componentSquare, height: Constants.componentSquare)
                    .foregroundStyle(Color(hex: ColorPalette.darkGray).opacity(0.8))
                    .clipShape(.rect(cornerRadius: Constants.componentCornerRadius))
                    .overlay {
                        RoundedRectangle(cornerRadius: Constants.componentCornerRadius)
                            .stroke(Color(hex: ColorPalette.darkGray), lineWidth: 2)
                    }
            }
            
            Image(image)
                .resizable()
                .frame(width: Constants.itemWidth, height: Constants.itemHeight)
        }
    }
}

#Preview {
    SecondItemPickerComponent(image: "Binóculo", pressed: false, chosen: false)}
