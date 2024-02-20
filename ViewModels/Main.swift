import SwiftUI

struct ContentView: View {
    @State private var isUserLoggedIn = false
    
    var body: some View {
        VStack {
            if isUserLoggedIn {
                GreenlightView(isUserLoggedIn: $isUserLoggedIn)
            } else {
                LoginView(isUserLoggedIn: $isUserLoggedIn)
            }
        }
        .onAppear {
            isUserLoggedIn = User.getUserIdentifier() != nil
        }
    }
}
