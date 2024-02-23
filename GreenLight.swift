import SwiftUI

@main
struct GreenLight: App {
    init() {
        RecordingsManager.shared.loadRecordings()
    }
    
    var body: some Scene {
        WindowGroup {
            //Initializaing the main view
            ContentView()
                .onDisappear {
                    RecordingsManager.shared.saveRecordings()
                }
        }
    }
}


