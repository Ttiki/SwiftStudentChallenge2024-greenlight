//
//  SwiftUIView.swift
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
        // Ajoutez d'autres soundscapes ici...
    ]
    
    var body: some View {
        NavigationView {
            List(soundscapes, id: \.name) { soundscape in
                NavigationLink(destination: SoundscapeCustomizationView(soundscapeName: soundscape.name)) {
                    HStack {
                        Image(systemName: soundscape.iconName) // Utiliser l'icône
                            .foregroundColor(.green) // Adaptez à votre palette
                        Text(soundscape.name)
                    }
                }
            }
            .navigationTitle("Soundscapes")
        }
    }
}
