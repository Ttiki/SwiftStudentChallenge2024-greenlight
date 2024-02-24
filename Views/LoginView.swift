//
//  LoginView.swift
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
            // Your login content
            Button("Log In") {
                isUserLoggedIn = true // Update based on actual login logic
            }
        }
}
