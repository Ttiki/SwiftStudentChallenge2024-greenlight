//
//  ThoughtRecording.swift
//
//
//  Created by Clément Combier on 23/02/2024.
//

import Foundation


struct ThoughtRecording: Recording {
    var id: UUID
    var date: Date
    var mood: Double
    var description: String
}
