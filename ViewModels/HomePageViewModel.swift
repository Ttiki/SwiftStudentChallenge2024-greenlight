//
//  HomePageViewModel.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import Foundation

class HomePageViewModel: ObservableObject{
    
    var statistics: [(String, String)] = [
        ("Days Without Taking", "69"),
        ("Dream Recording Streak", "5"),
    ]
    var growthStage: Int = 1 // Initial growth stage, managed by this parent view or another logic
    
    
    let encouragingMessages: [String] = [
        "Remember, it's okay not to have everything figured out. Take each day at your own pace.",
        "You are stronger than you think, and you're doing better than you realize.",
        "Be gentle with yourself. You're meeting parts of yourself you've been at war with.",
        "Your feelings are valid here. It's safe to express yourself, no matter the weather inside.",
        "Every step forward, no matter how small, is a victory. Celebrate your progress.",
        "You're not alone in this. We're here to support you through every high and low.",
        "It's perfectly okay to ask for help. Doing so is a sign of strength, not weakness.",
        "You are more than your struggles. Your light shines even on cloudy days.",
        "Take a moment to appreciate how far you've come. You've grown in ways you might not even realize.",
        "Your journey is unique, and so is your strength. Keep going, one step at a time.",
        "You deserve to be heard, seen, and supported. We're listening.",
        "Embrace your journey with kindness. Every experience is part of your growth.",
        "Your presence here is a brave step towards healing and understanding. Welcome.",
        "Take time to nourish your soul and rest. You're doing great, and it's okay to pause.",
        "Remember, healing is not linear. Be patient and kind with your progress."
    ]
    
    //We could retrieve user information based on their login
    let defaultUser : User = User(name: "User", email: "user@mail.com")
    
    
}
