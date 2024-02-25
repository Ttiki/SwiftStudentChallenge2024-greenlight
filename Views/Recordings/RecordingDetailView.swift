//
//  RecordingDetailView.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import SwiftUI

import SwiftUI

struct RecordingDetailView: View {
    @EnvironmentObject var viewModel: RecordingsViewModel
    let recordingType: RecordingType
    @State private var showForm = false
    @State private var showList = false

    var body: some View {
        VStack {
            Button("Add a recording") {
                showForm = true
            }
            .sheet(isPresented: $showForm) {
                GeneralRecordingForm(recordingType: recordingType).environmentObject(viewModel)
            }
            
            Button("See recordings") {
                showList = true
            }
            .sheet(isPresented: $showList) {
                RecordingEntriesListView(recordingType: recordingType).environmentObject(viewModel)
            }
        }
        .navigationTitle("\(recordingType.displayName) Recordings")
    }
}

