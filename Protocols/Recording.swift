//
//  Recording.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import Foundation
 
protocol Recording: Codable, Identifiable{
    var id: UUID { get set}
    var date: Date { get set}
    var maxStrike: Int { get set}
    var currentStrike: Int { get set}
    var mood: Double { get set}
    var description: String { get set}
}
