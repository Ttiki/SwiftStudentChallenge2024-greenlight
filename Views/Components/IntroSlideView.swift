import SwiftUI

struct IntroSlideView: View {
    var imageName: String
    var titleKey: String
    var descriptionKey: String

    // Access the current theme colors
    let theme = ThemeManager.shared.themeColors

    var body: some View {
        ZStack {
            // Background
            theme.secondary
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
                    .foregroundColor(.white)
                Text(NSLocalizedString(titleKey, comment: "Intro slide title"))
                    .font(.title)
                    .padding(.top, 20)
                    .foregroundColor(.white)
                Text(NSLocalizedString(descriptionKey, comment: "Intro slide description"))
                    .font(.body)
                    .padding()
                    .foregroundColor(.white)
            }
            .padding()
            .background(theme.primary)
            .cornerRadius(10)
            .shadow(radius: 5) // Add a shadow for depth
        }
       
        
    }
    
}
