//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

import SwiftUI

struct HomePageView: View {
    // Accessing the current theme colors from ThemeManager
    @ObservedObject var theme = ThemeManager.shared
    
    @State private var username: String = "Username" // Replace with actual data source
    @State private var motivationMessage: String = "Keep going, you're doing great!" // Replace with actual data source
    @State private var statistics: [(String, String)] = [
        ("Days Without Taking", "69"),
        ("Dream Recording Streak", "5"),
    ]
    @State private var growthStage: Int = 1 // Initial growth stage, managed by this parent view or another logic
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    PlantImageView(growthStage: growthStage)
                    
                    Text("Welcome back \(username)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(theme.themeColors.primary) // Directly using primary color from theme
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    Text(motivationMessage)
                        .font(.title2)
                        .foregroundColor(theme.themeColors.secondary) // Directly using secondary color from theme
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Divider()
                    
                    // Buttons for various actions
                    NavigationView() {
                        Form {
                            Section(header: Text("How are you doing today?").foregroundColor(theme.themeColors.primary)) { // Theme color for the header
                                Button("Record emotion state", action: {})
                                Button("Record negative thoughts", action: {})
                                Button("Record dream", action: {})
                                Button("Record activity", action: {})
                                Button("Talk to the chatbot", action: {
                                    showAlert = true
                                })
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Carousel for statistics
                    TabView {
                        ForEach(statistics, id: \.0) { stat in
                            GlobalStatsCard(title: stat.0, stats: stat.1)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 220) // Ensure carousel has a defined height
                }
                .padding()
            }
            .navigationTitle("Main Page")
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Functionality not implemented!"),
                    message: Text("This is a demo. You would be redirected to the chatbot. This functionality has not been implemented for this demo!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
