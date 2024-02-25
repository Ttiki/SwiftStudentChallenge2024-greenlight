//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import SwiftUI

struct GeneralRecordingForm: View {
    @EnvironmentObject var viewModel: RecordingsViewModel
    @Environment(\.presentationMode) var presentationMode
    let recordingType: RecordingType
    
    
    @State private var date = Date()
    @State private var mood: Double = 5.0
    @State private var description: String = ""
    
    var moodDescription: String {
        switch mood {
        case 0..<2:
            return "Really Bad"
        case 2..<4:
            return "Bad"
        case 4..<6:
            return "Neutral"
        case 6..<8:
            return "Good"
        case 8...10:
            return "Very Good"
        default:
            return "Unknown"
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                Slider(value: $mood, in: 0...10, step: 0.1)
                Text("Mood: \(moodDescription)") // This text updates based on the slider's value
                TextField("Description", text: $description)
                
                Button("Save") {
                    // Logic to save the recording based on the type
                    saveRecording()
                    
                    // Dismiss the form view
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("New \(recordingType.displayName) Recording", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func saveRecording() {
        guard let newRecording = createRecording() else { return }
        // `ofType` parameter requires the exact type of the recording, which might need reflection or direct type passing
        viewModel.addRecording(newRecording)
    }
    
    private func createRecording() -> (any Recording)? {
        switch recordingType {
        case .emotion:
            return EmotionRecording(id: UUID(), date: date, mood: mood, description: description)
        case .dream:
            return DreamRecording(id: UUID(), date: date, mood: mood, description: description)
        case .activity:
            return ActivityRecording(id: UUID(), date: date, mood: mood, description: description)
        case .thought:
            return ThoughtRecording(id: UUID(), date: date, mood: mood, description: description)
        }
    }
}
