//
//  IntroductionView.swift
//
//
//  Created by Clément Combier on 19/02/2024.
//

import SwiftUI

struct IntroductionView: View {
    
    var onCompletion: () -> Void
    // Access the current theme colors
    @ObservedObject var theme = ThemeManager.shared
    
    var body: some View {
        TabView {
            // Slide 1
            IntroSlideView(imageName: "house",
                       titleKey: "Welcome",
                       descriptionKey: "Welcome to GreenLight, your safe haven for mental health exploration and support. Here, you are not alone. We've created a nurturing space where you can freely express yourself, track your mood, and find resources tailored to your journey. Remember, taking the step to understand and care for your mental health is a sign of strength.")
            
            // Slide 2
            IntroSlideView(imageName: "brain.head.profile",
                       titleKey: "Overcoming the Taboo",
                       descriptionKey: "In our society, the stigma around mental health often silences those in need. It's time to break the chains of this taboo. Mental health is an essential part of our overall well-being, and seeking help or discussing it should never be seen as shameful or a sign of weakness. Together, we can shift perceptions and create a more understanding world.")
            
            
            // Slide 3
            IntroSlideView(imageName: "target",
                       titleKey: "Goal of the Application",
                       descriptionKey: "Our goal is simple: to empower you with tools and insights to manage your mental health effectively. Whether it's tracking your mood, understanding your thoughts through journaling, or finding calm with meditation, GreenLight is here to guide you towards a balanced mind and a happier life.")
            
            // Slide 4
            IntroSlideView(imageName: "tree",
                       titleKey: "Choose Your Plant",
                       descriptionKey: "As you embark on this journey, choose a companion to grow alongside you—a symbol of your progress and flourishing mental health. Would you prefer a resilient cactus or a nurturing simple plant? Don't worry; this choice is just for fun and can always be changed later in the settings. It's a visual representation of your growth as you use the app.")
            
            // Slide 5
            IntroSlideView(imageName: "paintbrush",
                       titleKey: "Choose Your Theme",
                       descriptionKey: "Personalize your journey with us by selecting the theme that resonates most with you. Do you find calm in the serenity of green, or does the tranquility of blue speak to you? Choose now, and remember, you can always adjust your preference in the settings later.")
            
            // Slide 6
            IntroSlideView(imageName: "gear",
                       titleKey: "Login and Launch",
                       descriptionKey: "Now, let's take the first step together. Sign in to begin your journey with GreenLight. Your path to understanding and improving your mental health starts here. Welcome aboard!")
            ZStack {
                // Background
                theme.themeColors.secondary
                VStack  {
                    Text("Finalize Your Settings")
                        .font(.title)
                        
                    Button("Get Started") {
                        onCompletion()
                    }
                    .font(.title2)
                    .padding()
                    .background(theme.themeColors.primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }.padding()
                
            }
            
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

