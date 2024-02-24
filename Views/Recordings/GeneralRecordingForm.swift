//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 24/02/2024.
//

import SwiftUI

struct GeneralRecordingForm: View {
    @EnvironmentObject var viewModel: RecordingViewModel
    let recordingType: RecordingType

    @State private var date = Date()
    @State private var maxStrike: Int = 0
    @State private var currentStrike: Int = 0
    @State private var mood: Double = 5.0
    @State private var description: String = ""

    var body: some View {
        Form {
            DatePicker("Date", selection: $date, displayedComponents: .date)
            Stepper("Max Strike: \(maxStrike)", value: $maxStrike)
            Stepper("Current Strike: \(currentStrike)", value: $currentStrike)
            Slider(value: $mood, in: 0...10, step: 0.1)
            TextField("Description", text: $description)
            
            Button("Save") {
                saveRecording()
            }
        }
    }
    
    private func saveRecording() {
        guard let newRecording = createRecording() else { return }
        // `ofType` parameter requires the exact type of the recording, which might need reflection or direct type passing
        viewModel.addNewRecording(newRecording)
    }
    
    private func createRecording() -> (any Recording)? {
        switch recordingType {
        case .emotion:
            return EmotionRecording(id: UUID(), date: date, maxStrike: maxStrike, currentStrike: currentStrike, mood: mood, description: description)
        case .dream:
            return DreamRecording(id: UUID(), date: date, maxStrike: maxStrike, currentStrike: currentStrike, mood: mood, description: description)
        // Add cases for other recording types
        default:
            return nil
        }
    }
}
