//
//  ThoughtRecordingFormView.swift
//  
//
//  Created by Clément Combier on 24/02/2024.
//

import SwiftUI

struct ThoughtRecordingFormView: View {
    @State private var moodIntensity: Double = 0.5 // Range from 0.0 to 1.0
    @State private var description: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Record Your Emotion")) {
                    Slider(value: $moodIntensity, in: 0.0...1.0)
                    TextField("Description", text: $description)
                }
                
                Button("Save") {
                    // Save the emotion recording
                }
            }
            .navigationTitle("Emotion Recording")
        }
    }
}
