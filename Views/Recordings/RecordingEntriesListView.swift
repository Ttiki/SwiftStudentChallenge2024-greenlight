//
//  RecordingEntriesListView.swift
//
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct RecordingEntriesListView: View {
    @EnvironmentObject var viewModel: RecordingsViewModel
    var recordingType: RecordingType
    
    var recordings: [any Recording] {
        viewModel.getSelectedRecording(ofType: recordingType)
    }

    var body: some View {
        List {
            ForEach(recordings.indices, id: \.self) { index in
                if let recording = recordings[index] as? (any Recording) {
                    VStack(alignment: .leading) {
                        Text(DateFormatter.localizedString(from: recording.date, dateStyle: .long, timeStyle: .none))
                        Text(recording.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete(perform: deleteRecording)
        }
        .navigationTitle("\(recordingType.displayName) Entries")
    }
    
    private func deleteRecording(at offsets: IndexSet) {
        for index in offsets {
            if let recording = recordings[index] as? (any Recording) {
                print("Removing recording :")
                viewModel.removeRecording(recording)
            }
        }
    }
}
