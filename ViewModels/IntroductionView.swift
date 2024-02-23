//
//  SwiftUIView.swift
//
//
//  Created by Clément Combier on 19/02/2024.
//

import SwiftUI

struct IntroductionView: View {
    
    var body: some View {
        TabView {
            //Displaying all intro slides
            ForEach(1...6, id: \.self) { index in
                    IntroSlide(imageName: "imageName\(index)", // Update this as needed
                               titleKey: "s\(index)_title",
                               descriptionKey: "s\(index)_body")
                }
            VStack {
                Text("Finalize Your Settings")
                Button("Get Started") {
                    
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

