//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 19/02/2024.
//

import SwiftUI

struct IntroductionView: View {
    
    // To set the firstLaunch flag to false
    @Binding var isFirstLaunch: Bool
    
    var body: some View {
        TabView {
            /*IntroSlide(imageName: "plant1", titleKey: "Welcome", descriptionKey: "Discover the world of plants.")
            IntroSlide(imageName: "plant2", titleKey: "Choose Your Plant", descriptionKey: "Select the plant you'd like to grow.")*/
            // Add more slides as needed
            VStack {
                Text("Finalize Your Settings")
                // Include settings options here, e.g., plant selection
                Button("Get Started") {
                    isFirstLaunch = false
                    // Save this preference to persistent storage
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

