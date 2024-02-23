//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 23/02/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasCompletedIntro") private var hasCompletedIntro: Bool = false
    @AppStorage("isUserLoggedIn") private var isUserLoggedIn: Bool = false
    
    var body: some View {
        Group {
            if !hasCompletedIntro {
                IntroductionView()
            }  else if !isUserLoggedIn {
                LoginView()
            } else {
                GreenlightView()
            }
        }
    }
}
