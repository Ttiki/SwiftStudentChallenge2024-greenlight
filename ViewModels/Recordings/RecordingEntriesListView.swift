//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct RecordingEntriesListView: View {
    var recordingType: String
    // Simulacre de données - remplacez par vos données réelles
    @State private var emotionRecordings: [EmotionRecording] = RecordingsManager.shared.emotionRecordings
    
    @State private var editMode = EditMode.inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(emotionRecordings, id: \.id) { recording in
                    Text(recording.description)
                    
                }.onDelete(perform: delete)
                
            }
            .navigationTitle("Recordings")
            .navigationBarItems(trailing: EditButton())
            .environment(\.editMode, $editMode)
        }
    }
    
    func delete(at offsets: IndexSet) {
        emotionRecordings.remove(atOffsets: offsets)
        RecordingsManager.shared.deleteEmotionRecording(id: offsets.count)
    }
}
