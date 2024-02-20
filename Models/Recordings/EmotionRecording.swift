//
//  File.swift
//  
//
//  Created by Clément Combier on 18/02/2024.
//

import Foundation

// CReocrding for emotion specs
class EmotionRecording: Recording {
    var emotionLevel: Int
    //TODO: Implement this class properly
    
    init(date: Date, emotionLevel: Int) {
        self.emotionLevel = emotionLevel
        super.init(date: date)
    }
}
