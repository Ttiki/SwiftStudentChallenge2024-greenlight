//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

struct RecordingDetailView: View {
    var recordingType: String
    @State private var showList = false

    var body: some View {
        VStack {
            // Placeholder pour les statistiques
            Text("\(recordingType) statistics")
            
            Button("Add a recodring") {
                // Logique pour ajouter un nouvel enregistrement
            }
            
            Button("See recordings") {
                showList = true
            }
            .sheet(isPresented: $showList) {
                RecordingEntriesListView(recordingType: recordingType)
            }
        }
        .navigationTitle(recordingType)
    }
}
