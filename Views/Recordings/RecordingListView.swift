//
//  RecordingsListView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct RecordingsListView: View {
    @EnvironmentObject var viewModel: RecordingViewModel
    
    var body: some View {
        NavigationView {
            
            List(RecordingType.allCases) { type in
                IconButtonView(name: type.displayName, iconName: type.iconName)
                .onTapGesture {
                    viewModel.selectRecordingType(type)
                    // Navigate to RecordingDetailView for the selected type
                    RecordingEntriesListView()
                }
            }
            
            .navigationTitle("Recordings")
        }
    }
}
