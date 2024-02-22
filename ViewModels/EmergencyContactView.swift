//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 21/02/2024.
//

import SwiftUI

struct EmergencyContactView: View {
    @State private var contactName: String = ""
    @State private var contactNumber: String = ""

    var body: some View {
        Form {
            Section(header: Text("Emergency Contact")) {
                TextField("Contact Name", text: $contactName)
                TextField("Contact Number", text: $contactNumber)
                Button("Save Contact") {
                    // Save contact information securely
                    UserDefaults.standard.set(contactName, forKey: "EmergencyContactName")
                    UserDefaults.standard.set(contactNumber, forKey: "EmergencyContactNumber")
                }
            }
        }
        .navigationTitle("Settings")
    }
}
