//
//  RecordingsListView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct RecordingsListView: View {
    @EnvironmentObject var viewModel: RecordingsViewModel

    var body: some View {
        NavigationView {
            List(RecordingType.allCases, id: \.self) { type in
                NavigationLink(destination: RecordingDetailView(recordingType: type).environmentObject(viewModel)) {
                    HStack {
                        IconButtonView(name: type.displayName, iconName: type.iconName)
                    }
                }
            }
            .navigationTitle("Recordings")
        }
    }
}
