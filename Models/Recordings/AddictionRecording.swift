//
//  AddictionRecording.swift
//  
//
//  Created by Clément Combier on 22/02/2024.
//

import Foundation

class AddictionRecording: Recording{
    var id: UUID
    var date: Date
    var maxStrike: Int
    var currentStrike: Int
    var mood: Double
    var description: String
    
    
    init(id: UUID = UUID(), date: Date, maxStrike: Int, currentStrike: Int, mood: Double, description: String) {
        self.id = id
        self.date = date
        self.maxStrike = maxStrike
        self.currentStrike = currentStrike
        self.mood = mood
        self.description = description
    }
}
