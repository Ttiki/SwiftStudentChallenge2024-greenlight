//
//  ActivityRecording.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import Foundation

struct ActivityRecording: Recording, Codable{
    var id: UUID
    var date: Date
    var maxStrike: Int
    var currentStrike: Int
    var mood: Double
    var description: String    
}
