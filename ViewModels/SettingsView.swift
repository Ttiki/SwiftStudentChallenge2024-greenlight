//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isUserLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("Account")) {
                    Button("Logout") {
                        User.logout()
                        isUserLoggedIn = false
                    }
                }
            }
            
            
            .navigationTitle("Settings")
        }
        
        
        
    }
}
