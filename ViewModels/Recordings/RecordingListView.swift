//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct RecordingsListView: View {
    let recordingTypes = [
        RecordingType(name: "Emotion", iconName: "heart.fill"),
        RecordingType(name: "Negative Thoughts", iconName: "bubble.left.fill"),
        RecordingType(name: "Dream", iconName: "cloud.moon.fill"),
        // Ajoutez d'autres types ici...
    ]

    var body: some View {
        NavigationView {
            List(recordingTypes, id: \.name) { type in
                NavigationLink(destination: RecordingDetailView(recordingType: type.name)) {
                    HStack {
                        Image(systemName: type.iconName) // Affiche l'icône
                            .foregroundColor(.accentColor) // Personnalisez la couleur si nécessaire
                        Text(type.name)
                    }
                }
            }
            .navigationTitle("Recordings")
        }
    }
}
