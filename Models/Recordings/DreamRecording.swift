//
//  DreamRecording.swift
//  
//
//  Created by Clément Combier on 22/02/2024.
//

import Foundation

struct DreamRecording: Recording{
    var id: UUID
    var date: Date
    var mood: Double
    var description: String
}
