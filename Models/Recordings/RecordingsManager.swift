//
//  File.swift
//  
//
//  Created by Clément Combier on 22/02/2024.
//

import Foundation

class RecordingsManager {
    static let shared = RecordingsManager()
    
    private init() {} // Private initialization to ensure singleton instance
    
    var emotionRecordings: [EmotionRecording] = []
    var dreamRecordings: [DreamRecording] = []
    
    // Function to add a new emotion recording
    func addEmotionRecording(_ recording: EmotionRecording) {
        emotionRecordings.append(recording)
        saveRecordings()
    }
    
    // Function to add a new dream recording
    func addDreamRecording(_ recording: DreamRecording) {
        dreamRecordings.append(recording)
        saveRecordings()
    }
    
    func deleteEmotionRecording(withId id: UUID) {
            emotionRecordings.removeAll { $0.id == id }
            saveRecordings()
        }
    func deleteEmotionRecording(id: Int) {
            emotionRecordings.remove(at: id)
            saveRecordings()
        }

        func deleteDreamRecording(withId id: UUID) {
            dreamRecordings.removeAll { $0.id == id }
            saveRecordings()
        }
    
    func deleteDreamRecording(id: Int) {
        dreamRecordings.remove(at: id)
        saveRecordings()
    }

  
    
}

extension RecordingsManager {
    func saveRecordings() {
        let encoder = JSONEncoder()
        if let encodedEmotionRecordings = try? encoder.encode(emotionRecordings),
           let encodedDreamRecordings = try? encoder.encode(dreamRecordings) {
            UserDefaults.standard.set(encodedEmotionRecordings, forKey: "EmotionRecordings")
            UserDefaults.standard.set(encodedDreamRecordings, forKey: "DreamRecordings")
        }
    }
    
    func loadRecordings() {
        let decoder = JSONDecoder()
        if let emotionData = UserDefaults.standard.data(forKey: "EmotionRecordings"),
           let dreamData = UserDefaults.standard.data(forKey: "DreamRecordings"),
           let loadedEmotionRecordings = try? decoder.decode([EmotionRecording].self, from: emotionData),
           let loadedDreamRecordings = try? decoder.decode([DreamRecording].self, from: dreamData) {
            emotionRecordings = loadedEmotionRecordings
            dreamRecordings = loadedDreamRecordings
        }
    }
}
