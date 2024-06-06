//
//  Constants.swift
//  MiniChallenge05 Watch App
//
//  Created by Luca on 04/06/24.
//

import Foundation
import SwiftUI

struct Constants {
    
    static let itemWidth = WKInterfaceDevice.current().screenBounds.width/6.5
    static let itemHeight = WKInterfaceDevice.current().screenBounds.width/6.5
    
    static let smallItemWidth = WKInterfaceDevice.current().screenBounds.width/10
    static let smallItemHeight = WKInterfaceDevice.current().screenBounds.width/10
    
    static let componentWidth = WKInterfaceDevice.current().screenBounds.width/1.1
    static let componentCornerRadius : CGFloat = 14
    
    static let componentTitle : CGFloat = 15
    static let componentFootnote : CGFloat = 12
    
}
