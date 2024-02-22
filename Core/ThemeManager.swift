//
//  File.swift
//  
//
//  Created by Clément Combier on 21/02/2024.
//

import Foundation
import SwiftUI

// Define the app's theme options
enum AppTheme: String {
    case green, blue
}

// Theme color definitions
struct ThemeColors {
    var primary: Color
    var secondary: Color
    var action: Color
    var highlight: Color
    var success: Color
    var warning: Color
    var error: Color
}

class ThemeManager {
    static let shared = ThemeManager()
    
    // Use @AppStorage to automatically save and load the theme preference
    @AppStorage("userTheme") static var currentTheme: AppTheme = .green // Default to green
    
    // Define your themes
    static let greenTheme = ThemeColors(primary: Color("Green/primary"), secondary: Color("Green/secondary"), action: Color("Green/action"), highlight: Color("Green/highlight"), success: Color("Green/success"), warning: Color("Green/warning"), error: Color("Green/error"))
    static let blueTheme = ThemeColors(primary: Color("Blue/primary"), secondary: Color("Blue/secondary"), action: Color("Blue/action"), highlight: Color("Blue/highlight"), success: Color("Blue/success"), warning: Color("Blue/warning"), error: Color("Blue/error"))
    
    
    // Static method to access current theme colors
        static func currentThemeColors() -> ThemeColors {
            return ThemeManager.currentTheme == .green ? ThemeManager.greenTheme : ThemeManager.blueTheme
        }
}
