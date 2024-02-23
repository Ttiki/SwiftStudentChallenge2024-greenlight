//
//  File.swift
//
//
//  Created by Clément Combier on 21/02/2024.
//

import Foundation
import SwiftUI

// Define the app's theme options
enum AppTheme: String, CaseIterable, Identifiable {
    case green, blue
    
    var id: String { self.rawValue }
    
    // Add a user-friendly name for each theme
    var displayName: String {
        switch self {
        case .green: return "Green"
        case .blue: return "Blue"
        }
    }
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

class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    // Move from static to instance property
    @AppStorage("userTheme") var currentTheme: AppTheme = .green
    
    @Published var themeColors: ThemeColors
    
    init() {
        // Initialize themeColors based on the current theme
        self.themeColors = ThemeManager.themeColors(for: .green)
    }
    
    // Static method to define your themes
    private static func themeColors(for theme: AppTheme) -> ThemeColors {
        switch theme {
        case .green:
            return ThemeColors(primary: Color("Green/primary"), secondary: Color("Green/secondary"), action: Color("Green/action"), highlight: Color("Green/highlight"), success: Color("Green/success"), warning: Color("Green/warning"), error: Color("Green/error"))
        case .blue:
            return ThemeColors(primary: Color("Blue/primary"), secondary: Color("Blue/secondary"), action: Color("Blue/action"), highlight: Color("Blue/highlight"), success: Color("Blue/success"), warning: Color("Blue/warning"), error: Color("Blue/error"))
        }
    }
    
    // Update themeColors based on the current theme
    func updateThemeColors() {
        self.themeColors = ThemeManager.themeColors(for: currentTheme)
    }
}
