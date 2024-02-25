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
    
    let dateFormatter = DateFormatter()
    
    
    var body: some View {
        
        
        List {
            // Dynamically generate rows based on the recordings of the selected type
            ForEach(viewModel.getSelectedRecording(ofType: recordingType), id: \.id) { recording in
                VStack(alignment: .leading) {
                    // Assuming each recording has a title or can be identified in a meaningful way for display
                    Text(recording.description)
                        .padding()
                    
                    Text(dateFormatter.string(from: recording.date))
                        .padding()
                }
            }
            //.onDelete(perform: deleteRecordings)
        }
        .navigationTitle("\(recordingType.displayName) Entries")
        .onAppear {
            //$viewModel.(ofType: recordingType)
        }
    }
    
    private func deleteRecordings(at offsets: IndexSet) {
       // viewModel.removeRecording(ofType: <#T##Recording.Protocol#>, withId: <#T##UUID#>)(at: offsets, ofType: recordingType)
    }
}
