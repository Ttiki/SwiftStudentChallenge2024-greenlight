//
//  File.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import Foundation

// Handle the different type of recordings available in the app
enum RecordingType: CaseIterable, Identifiable {
    case emotion
    case dream
    case activity
    case thought
    
    var id: RecordingType { self }
    
    var displayName: String {
        switch self {
        case .emotion:
            return "Emotion"
        case .dream:
            return "Dream"
        case .activity:
            return "Activity"
        case .thought:
            return "Activity"
        }
    }
    
    var iconName: String {
        switch self {
        case .emotion:
            return "heart.fill"
        case .dream:
            return "cloud.moon.fill"
        case .activity:
            return "figure.walk"
        case .thought:
            return "brain.head.profile"
        }
    }
}


class RecordingsViewModel: ObservableObject {
    private let manager = RecordingsManager.shared
    
    @Published var emotionRecordings: [EmotionRecording] = []
    @Published var dreamRecordings: [DreamRecording] = []
    @Published var activityRecordings: [ActivityRecording] = []
    @Published var thoughtRecordings: [ThoughtRecording] = []

    init() {
        loadAllRecordings()
    }
    
    func loadAllRecordings() {
        emotionRecordings = manager.getEmotionRecordings()
        dreamRecordings = manager.getDreamRecordings()
        activityRecordings = manager.getActivityRecordings()
        thoughtRecordings = manager.getThoughtRecordings()
    }
    
    func addRecording<T: Recording>(_ recording: T) {
        switch recording {
        case let emotionRecording as EmotionRecording:
            manager.addEmotionRecording(emotionRecording)
        case let dreamRecording as DreamRecording:
            manager.addDreamRecording(dreamRecording)
        case let activityRecording as ActivityRecording:
            manager.addActivityRecording(activityRecording)
        case let thoughtRecording as ThoughtRecording:
            manager.addThoughtRecording(thoughtRecording)
        default:
            break
        }
        loadAllRecordings() // Refresh all recordings
    }
    
    // TODO : Add the remove function
}
