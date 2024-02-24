//
//  SoundscapeListView.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct SoundscapeListView: View {
    let soundscapes = [
        Soundscape(name: "Storm", iconName: "cloud.rain.fill"),
        Soundscape(name: "Forest", iconName: "leaf.fill"),
        Soundscape(name: "Ocean", iconName: "waveform.path.ecg")
        // Add more soundscapes here...
    ]
    
    // Accessing the current theme colors from ThemeManager
    @ObservedObject var theme = ThemeManager.shared

    var body: some View {
        NavigationView {
            List(soundscapes, id: \.name) { soundscape in
                NavigationLink(destination: SoundscapeCustomizationView(soundscapeName: soundscape.name)) {
                    HStack {
                        Image(systemName: soundscape.iconName)
                            .foregroundColor(theme.themeColors.action) // Using the action color from the current theme
                        Text(soundscape.name)
                            .foregroundColor(theme.themeColors.primary) // Using the primary color from the current theme
                    }
                }
            }
            .navigationTitle("Soundscapes")
        }
    }
}
