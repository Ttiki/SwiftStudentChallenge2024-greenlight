//
//  ActivityRecording.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import Foundation

struct ActivityRecording: Recording{
    var id: UUID
    var date: Date
    var mood: Double
    var description: String    
}
