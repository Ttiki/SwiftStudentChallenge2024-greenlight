//
//  SwiftUIView.swift
//  
//
//  Created by Clément Combier on 16/02/2024.
//

import AuthenticationServices
import SwiftUI

// LoginView simulation
struct LoginView: View {
    @Binding var isUserLoggedIn: Bool
    
    var body: some View {
        Button("Login") {
            User.save(userIdentifier: "exampleUser123")
            // Proceed to main content view or update state to reflect login
            isUserLoggedIn = true
        }
    }
}
