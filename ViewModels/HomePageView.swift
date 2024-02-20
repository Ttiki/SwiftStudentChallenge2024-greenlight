//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

struct HomePageView: View {
    @State private var username: String = "Username" // Replace with actual data source
    @State private var motivationMessage: String = "Keep going, you're doing great!" // Replace with actual data source
    @State private var statistics: [(String, String)] = [
        ("Days Without Taking", "69"),
        ("Dream Recording Streak", "5"),
        // Add more statistics as needed
    ]
    @State private var growthStage: Int = 1 // Initial growth stage, managed by this parent view or another logic

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Plant image (to see evolution
                    PlantImageView(growthStage: growthStage)
                    
                    Text("Welcome back \(username)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Primary")) // Use your primary color here
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    Text(motivationMessage)
                        .font(.title2)
                        .foregroundColor(Color("Secondary")) // Use your secondary color here
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Divider()
                    
                    // Buttons for various actions
                    VStack(spacing: 20) {
                        Section(header: Text("How are you doing today?")){
                            Button("Record emotion state", action: {})
                                .foregroundColor(Color("Action")) // Use your action color here
                            Button("Record negative thoughts", action: {})
                                .foregroundColor(Color("Action")) // Use your action color here
                            Button("Record dream", action: {})
                                .foregroundColor(Color("Action")) // Use your action color here
                            Button("Record activity", action: {})
                                .foregroundColor(Color("Action")) // Use your action color here
                            Button("Talk to the chatbot", action: {})
                                .foregroundColor(Color("Action")) // Use your action color here
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Carousel for statistics
                    TabView {
                        ForEach(statistics, id: \.0) { data in
                            GlobalStatsCard(title: data.0, stats: data.1)
                                .foregroundColor(Color("Primary")) // Use your primary color here
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 300) // Adjust height as needed
                }
                .padding()
            }
            .navigationTitle("Main Page")
            
        }
    }
}
