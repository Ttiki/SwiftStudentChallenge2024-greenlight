//
//  File.swift
//  
//
//  Created by Clément Combier on 22/02/2024.
//

import Foundation

class AddictionType{
    var id: UUID
    var nom: String
    var type: String
    var description: String
    var addictionRecordings: [AddictionRecording]
    
    init(_ nom: String,
         _ type: String, 
         _ description: String,
         _ recordings: [AddictionRecording]) {
        self.id = UUID()
        self.nom = nom
        self.type = type
        self.description = description
        self.addictionRecordings=recordings
    }
    
}
