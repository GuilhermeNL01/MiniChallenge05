//
//  SecondChoiceComponent.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 06/06/24.
//

import SwiftUI

struct SecondChoiceComponent: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            Button("Press to dismiss") {
                
            }
            .font(.title)
            .padding()
            .background(.black)
        }.toolbar {
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
    SecondChoiceComponent()
}
