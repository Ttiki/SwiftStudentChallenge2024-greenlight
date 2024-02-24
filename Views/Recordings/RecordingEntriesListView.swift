//
//  RecordingEntriesListView.swift
//
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct RecordingEntriesListView: View {
    @EnvironmentObject var viewModel: RecordingViewModel
    let recordingType: RecordingType

    // Assuming the viewModel has a method to fetch and provide an array of recordings specific to a type
    // And assuming the viewModel has a method to remove a recording by its ID
    var body: some View {
        List {
            ForEach($viewModel.getRecordings(ofType: recordingType), id: \.id) { recording in
                Text(recording.description) // Assuming 'description' is a property of your Recording type
            }
            .onDelete { offsets in
                deleteRecordings(at: offsets)
            }
        }
        .navigationTitle("\(recordingType.displayName) Entries")
        .onAppear {
            $viewModel.fetchRecordings(ofType: recordingType)
        }
    }
    
    private func deleteRecordings(at offsets: IndexSet) {
        let recordings = viewModel.getRecordings(ofType: recordingType)
        for index in offsets {
            let recording = recordings[index]
            viewModel.removeRecording(ofType: recordingType, withId: recording.id)
        }
        // Refresh the list after deletion
        viewModel.fetchRecordings(ofType: recordingType)
    }
}


