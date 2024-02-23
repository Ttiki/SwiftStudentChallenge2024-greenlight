//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isUserLoggedIn: Bool
    @Binding var hasCompletedIntro: Bool
    
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("App")) {
                    Button("Replay Intro Sequence") {
                        hasCompletedIntro = false
                    }
                }

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
