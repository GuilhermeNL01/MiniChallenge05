//
//  SecondPopupComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 07/06/24.
//

import SwiftUI

struct SecondPopupComponent: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var itemChosen: String
    
    @State private var pressed: Bool = false
    @State private var pressed2: Bool = false
    @State private var pressed3: Bool = false
    @State private var pressed4: Bool = false
    
    @State private var chosen: Bool = false
    @State private var chosen2: Bool = false
    @State private var chosen3: Bool = false
    @State private var chosen4: Bool = false

    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        if itemChosen == "Binóculo" {
                            pressed.toggle()
                            pressed2 = false
                            pressed3 = false
                            pressed4 = false
                        }
                        
                    } label: {
                        if itemChosen == "Binóculo" {
                            SecondItemPickerComponent(image: "Binóculo", pressed: pressed, chosen: true)
                        } else {
                            SecondItemPickerComponent(image: "Binóculo", pressed: pressed, chosen: false)
                        }
                    }.buttonStyle(CustomButton())
                    Spacer()
                    Button {
                        if itemChosen == "Camera" {
                            pressed2.toggle()
                            pressed = false
                            pressed3 = false
                            pressed4 = false
                        }
                    } label: {
                        if itemChosen == "Camera" {
                            SecondItemPickerComponent(image: "Camera", pressed: pressed2, chosen: true)
                        } else {
                            SecondItemPickerComponent(image: "Camera", pressed: pressed2, chosen: false)
                        }
                    }.buttonStyle(CustomButton())
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        if itemChosen == "Folder" {
                            pressed3.toggle()
                            pressed = false
                            pressed2 = false
                            pressed4 = false
                        }
                    } label: {
                        if itemChosen == "Folder" {
                            SecondItemPickerComponent(image: "Folder", pressed: pressed3, chosen: true)
                        } else {
                            SecondItemPickerComponent(image: "Folder", pressed: pressed3, chosen: false)
                        }
                        
                    }.buttonStyle(CustomButton())
                    Spacer()
                    Button {
                        if itemChosen == "Hat" {
                            pressed4.toggle()
                            pressed = false
                            pressed2 = false
                            pressed3 = false
                        }
                    } label: {
                        if itemChosen == "Hat" {
                            SecondItemPickerComponent(image: "Hat", pressed: pressed4, chosen: true)
                        } else {
                            SecondItemPickerComponent(image: "Hat", pressed: pressed4, chosen: false)
                        }
                    }.buttonStyle(CustomButton())
                    Spacer()
                }
            }
            .padding(.top, 5)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
    }

