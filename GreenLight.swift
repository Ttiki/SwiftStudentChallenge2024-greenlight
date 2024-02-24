import SwiftUI

@main
struct GreenLight: App {
    @AppStorage("hasCompletedIntro") private var hasCompletedIntro: Bool = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    @StateObject private var themeManager = ThemeManager.shared
    
   
    init() {
    
        // Load all recordings
        RecordingsManager.shared.loadRecordings(ofType: EmotionRecording.self)
        RecordingsManager.shared.loadRecordings(ofType: DreamRecording.self)
        RecordingsManager.shared.loadRecordings(ofType: ActivityRecording.self)
        RecordingsManager.shared.loadRecordings(ofType: ThoughtRecording.self)
    }
    
    var body: some Scene {
        WindowGroup {
            Group{
                if !hasCompletedIntro {
                    IntroductionView {
                        hasCompletedIntro = true
                    }
                } else if !isUserLoggedIn {
                    LoginView(isUserLoggedIn: $isUserLoggedIn)
                } else {
                    GreenlightView(isUserLoggedIn: $isUserLoggedIn, hasCompletedIntro: $hasCompletedIntro)
                }
            }
            .environmentObject(themeManager) // Correctly providing ThemeManager as an environment object
            .environmentObject(RecordingViewModel())
            .accentColor(themeManager.themeColors.action) // Dynamically set the accent color
            .environment(\.locale, Locale(identifier: "en_US"))

        }
        
    }
}


