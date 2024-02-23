import SwiftUI

@main
struct GreenLight: App {
    @AppStorage("hasCompletedIntro") private var hasCompletedIntro: Bool = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    
    init() {
        RecordingsManager.shared.loadRecordings()
    }
    
    var body: some Scene {
        WindowGroup {
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
    }
}


