//
//  DreamRecordingFormView.swift
//  
//
//  Created by Clément Combier on 22/02/2024.
//

import SwiftUI

struct DreamRecordingFormView: View {
    @State private var dreamDate = Date()
    @State private var description: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Record Your Dream")) {
                    DatePicker("Date", selection: $dreamDate, displayedComponents: .date)
                    TextEditor(text: $description)
                        .frame(height: 200) // Set an appropriate height for text input
                }
                
                Button("Save") {
                    // Save the dream recording
                }
            }
            .navigationTitle("Dream Recording")
        }
    }
}
