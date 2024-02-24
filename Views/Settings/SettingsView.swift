//
//  SettingsView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isUserLoggedIn: Bool
    @Binding var hasCompletedIntro: Bool
    
    @ObservedObject var themeManager = ThemeManager.shared

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("App")) {
                    Button("Replay Intro Sequence") {
                        hasCompletedIntro = false
                    }
                    
                    Picker("Theme", selection: $themeManager.currentTheme) { // Bind directly to `currentTheme`
                        ForEach(AppTheme.allCases, id: \.self) { theme in
                            Text(theme.displayName).tag(theme)
                        }
                    }
                }
                
                Section(header: Text("Account")) {
                    Button("Logout") {
                        // Assuming `User.logout()` updates `isUserLoggedIn`
                        isUserLoggedIn = false
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .onChange(of: themeManager.currentTheme) { _ in
            themeManager.updateThemeColors() // Ensure theme colors are updated
            
        }
    }
}

