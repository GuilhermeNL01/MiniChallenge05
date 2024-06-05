//
//  Color.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 03/06/24.
//

import SwiftUI

// Extension for allowing Hex Code usage in Color.

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Struct for our Color Palette.

struct ColorPalette {
    
    // BLUE
    static let lightBlue = "35C6D9"
    static let darkBlue = "032227"
    
    // GRAY
    static let darkGray = "232323"
    
    // PINK
    static let darkPink = "300B36"
    static let lightPink = "CB48E0"
    
    // ORANGE
    static let darkOrange = "2C1301"
    static let lightOrange = "E5711C"
    
    
    // GREEN
    static let darkGreen = "052905"
    static let lightGreen = "1CE01E"
    
    // YELLOW
    static let darkYellow = "363706"
    static let lightYellow = "E6EA35"
}

// if you want to use this, use as follows: Color(hex: ColorPalette.darkBlue) or Color.init(hex: ColorPalette.darkBlue)
