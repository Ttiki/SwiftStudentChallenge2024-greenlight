//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 19/02/2024.
//

import SwiftUI

struct IntroSlide: View {
    var imageName: String
    var title: String
    var description: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text(title)
                .font(.title)
                .padding(.top, 20)
            Text(description)
                .font(.body)
                .padding()
        }
        .padding()
    }
}
