//
//  File.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import Foundation

// Base class for recordings. 
class Recording {
    var date: Date
    var id: UUID
    
    init(date: Date) {
        self.date = date
        self.id = UUID()
    }
}
