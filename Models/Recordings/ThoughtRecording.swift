//
//  ThoughtRecording.swift
//
//
//  Created by Clément Combier on 23/02/2024.
//

import Foundation


struct ThoughtRecording: Recording, Codable {
    var id: UUID
    var date: Date
    var maxStrike: Int
    var currentStrike: Int
    var mood: Double
    var description: String
}
