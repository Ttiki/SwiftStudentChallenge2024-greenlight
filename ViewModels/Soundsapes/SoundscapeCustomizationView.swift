//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct SoundscapeCustomizationView: View {
    var soundscapeName: String
    @State private var volume: Double = 0.5 // Exemple de réglage
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Slider(value: $volume, in: 0...1, step: 0.1)
                .padding()
            // Ajoutez d'autres sliders pour d'autres réglages ici
            
            Button("Play") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Playing \(soundscapeName)"), message: Text("This is a demo. The soundscape would play now."), dismissButton: .default(Text("OK")))
            }
            .padding()
        }
        .navigationTitle(soundscapeName)
    }
}
