//
//  Recording.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import Foundation
 
protocol Recording: Codable, Identifiable{
    var id: UUID { get }
    var date: Date { get }
    var maxStrike: Int { get }
    var currentStrike: Int { get }
    var mood: Double { get }
    var description: String { get }
}
