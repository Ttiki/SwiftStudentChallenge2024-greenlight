//
//  GreenlightView.swift
//
//
//  Created by Clément Combier on 16/02/2024.
//

import SwiftUI

struct GreenlightView: View {
    
    //Binding var
    @Binding var isUserLoggedIn: Bool
    @Binding var hasCompletedIntro: Bool
    
    //TODO : Implement
    @State private var userName = "User"
    @State private var motivationalMessage = "You are stronger than you think."
    
    var body: some View {
        TabView {
            // Homepage with quick access and statistics
            HomePageView(viewModel: HomePageViewModel())
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
            SettingsView(isUserLoggedIn: $isUserLoggedIn, hasCompletedIntro: $hasCompletedIntro)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
    
}
