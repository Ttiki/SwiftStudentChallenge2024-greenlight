//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 16/02/2024.
//

import SwiftUI

struct GreenlightView: View {
    
    // TODO : Implement
    @Binding var isUserLoggedIn: Bool
    @State private var userName = "User"
    @State private var motivationalMessage = "You are stronger than you think."
    
    var body: some View {
        TabView {
            // Homepage with quick access and statistics
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Main")
                }
            
            // See the list of recordings (by category)
            RecordingsListView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Recordings")
                }
        
            // See the list of soundscape to customize and play them.
            SoundscapeListView()
                    .tabItem {
                        Image(systemName: "music.note.list")
                        Text("Soundscapes")
                    }
            
            // Settings option
            SettingsView(isUserLoggedIn: $isUserLoggedIn)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
    
}
