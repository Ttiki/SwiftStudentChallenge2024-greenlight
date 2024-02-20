//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 19/02/2024.
//

import SwiftUI

struct IntroSlide: View {
    var imageName: String
    var titleKey: String
    var descriptionKey: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text(NSLocalizedString(titleKey, comment: "Intro slide title"))
                .font(.title)
                .padding(.top, 20)
            Text(NSLocalizedString(descriptionKey, comment: "Intro slide description"))
                .font(.body)
                .padding()
        }
        .padding()
    }
}
