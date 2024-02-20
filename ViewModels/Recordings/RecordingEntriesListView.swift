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
    @State var entries = ["Enregistrement 1", "Enregistrement 2"]
    @State private var editMode = EditMode.inactive

    var body: some View {
        NavigationView {
            List {
                ForEach(entries, id: \.self) { entry in
                    Text(entry)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Recordings")
            .navigationBarItems(trailing: EditButton())
            .environment(\.editMode, $editMode)
        }
    }
    
    func delete(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
}
