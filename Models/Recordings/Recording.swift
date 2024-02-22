//
//  File.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import Foundation

// Base class for recordings. 
class Recording: Decodable, Encodable {
    var id: UUID
    var date: Date
    var maxStrike: Int
    var currentStrike: Int
    var mood: Double
    var description: String
    
    init(_ date: Date,
         _ maxStrike: Int,
         _ currentStrike: Int,
         _ mood: Double,
         _ description: String) {
        self.date = date
        self.maxStrike = maxStrike
        self.currentStrike = currentStrike
        self.mood = mood
        self.description = description
        self.id = UUID()
    }
}
