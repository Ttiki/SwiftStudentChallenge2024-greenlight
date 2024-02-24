//
//  DreamRecording.swift
//  
//
//  Created by Clément Combier on 22/02/2024.
//

import Foundation

struct DreamRecording: Recording, Codable{
    var id: UUID
    var date: Date
    var maxStrike: Int
    var currentStrike: Int
    var mood: Double
    var description: String
}
