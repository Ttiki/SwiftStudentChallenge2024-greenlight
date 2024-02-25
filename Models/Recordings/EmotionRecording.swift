//
//  EmotionRecording.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import Foundation

struct EmotionRecording: Recording {
    var id: UUID
    var date: Date
    var mood: Double
    var description: String
}
