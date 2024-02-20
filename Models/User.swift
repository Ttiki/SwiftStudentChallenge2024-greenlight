//
//  User.swift
//  GreenLight
//
//  Created by Clément Combier on 08/02/2024.
//

import Foundation

// User model
struct User {
    var name: String
    var email: String
    // Simulate saving to UserDefaults (not secure, just for prototype)
    static func save(userIdentifier: String) {
            UserDefaults.standard.set(userIdentifier, forKey: "UserIdentifier")
        }
        
        static func getUserIdentifier() -> String? {
            UserDefaults.standard.string(forKey: "UserIdentifier")
        }
        
        static func logout() {
            UserDefaults.standard.removeObject(forKey: "UserIdentifier")
        }
}
