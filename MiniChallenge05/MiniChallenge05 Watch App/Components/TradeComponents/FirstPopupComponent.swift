//
//  FirstPopupComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct FirstPopupComponent: View {
    @Environment(\.dismiss) var dismiss
    @State var pressed: Bool = false
    @State var pressed2: Bool = false
    @State var pressed3: Bool = false
    @State var pressed4: Bool = false
    @State var itemChosen: String = ""

    var body: some View {
        VStack {
                HStack {
                    Spacer()
                    Button {
                        pressed.toggle()
                        pressed2 = false
                        pressed3 = false
                        pressed4 = false
                        if pressed {
                            itemChosen = "Binóculo"
                        } else {
                            itemChosen = ""
                        }
                    } label: {
                        ItemPickerComponent(image: "Binóculo", pressed: pressed)
                    }.buttonStyle(CustomButton())
                    Spacer()
                    Button {
                        pressed2.toggle()
                        pressed = false
                        pressed3 = false
                        pressed4 = false
                        if pressed {
                            itemChosen = "Camera"
                        } else {
                            itemChosen = ""
                        }
                    } label: {
                        ItemPickerComponent(image: "Camera", pressed: pressed2)
                    }.buttonStyle(CustomButton())
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        pressed3.toggle()
                        pressed = false
                        pressed2 = false
                        pressed4 = false
                        if pressed {
                            itemChosen = "Folder"
                        } else {
                            itemChosen = ""
                        }
                    } label: {
                        ItemPickerComponent(image: "Folder", pressed: pressed3)
                    }.buttonStyle(CustomButton())
                    Spacer()
                    Button {
                        pressed4.toggle()
                        pressed = false
                        pressed2 = false
                        pressed3 = false
                        if pressed {
                            itemChosen = "Hat"
                        } else {
                            itemChosen = ""
                        }
                    } label: {
                        ItemPickerComponent(image: "Hat", pressed: pressed4)
                    }.buttonStyle(CustomButton())
                    Spacer()
                }
            
        }
        .padding(.top, 5)
        .toolbar {
            ToolbarItem(placement: .confirmationAction){
                Button {
                    
                    dismiss()
                } label: {
                    Image(systemName: "checkmark")
                }

            }
        }
    }
}

#Preview {
    FirstPopupComponent()
}
