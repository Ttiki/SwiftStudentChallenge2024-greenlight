//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 09/02/2024.
//

import SwiftUI

struct GlobalStatsCard: View {
    var title: String
    var stats: String
    // Accessing the current theme colors from ThemeManager
    @ObservedObject var theme = ThemeManager.shared

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "chart.bar") // Example icon, change as needed
                    .foregroundColor(theme.themeColors.action) // Assuming dynamic theme colors
                    .imageScale(.large)
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(theme.themeColors.primary)
            }
            .padding(.top)

            Spacer()

            Text(stats)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(theme.themeColors.action)
                .padding(.bottom)
        }
        .padding()
        .frame(width: 250, height: 200) // Adjusted for better visibility in carousel
        .background(theme.themeColors.secondary)
        .cornerRadius(20)
        .shadow(radius: 5) // Optional: adds depth to the card
        .padding(.horizontal)
    }
}

