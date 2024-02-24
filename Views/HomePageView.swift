//
//  HomePageView.swift
//
//
//  Created by Clément Combier on 17/02/2024.
//

import SwiftUI

import SwiftUI

struct HomePageView: View {
    // Accessing the current theme colors from ThemeManager
    @EnvironmentObject var theme : ThemeManager
    @EnvironmentObject var recordingViewModel: RecordingViewModel
    
    @ObservedObject var viewModel: HomePageViewModel


    // For quick debug
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    //PlantImageView(growthStage: growthStage)
                    
                    Text("Welcome back \(viewModel.defaultUser.name)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(theme.themeColors.primary) // Directly using primary color from theme
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    
                    Text(viewModel.encouragingMessages.randomElement()!)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .foregroundColor(theme.themeColors.secondary) // Directly using secondary color from theme
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                    
                    Divider()
                    
                    // Buttons for various actions
                    NavigationView {
                        
                        List(RecordingType.allCases) { type in
                            IconButtonView(name: type.displayName, iconName: type.iconName)
                            .onTapGesture {
                                recordingViewModel.selectRecordingType(type)
                                // Navigate to RecordingDetailView for the selected type
                                
                            }
                        }
                        
                        .navigationTitle("Recordings")
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Carousel for statistics
                    TabView {
                        ForEach(viewModel.statistics, id: \.0) { stat in
                            GlobalStatsCardView(title: stat.0, stats: stat.1)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 300) // Ensure carousel has a defined height
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
