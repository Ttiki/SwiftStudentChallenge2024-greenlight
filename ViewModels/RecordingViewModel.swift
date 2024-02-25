//
//  File.swift
//
//
//  Created by Clément Combier on 24/02/2024.
//

import Foundation




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
    
    func getSelectedRecording(ofType type: RecordingType) -> [any Recording]{
        switch type {
        case .emotion:
            return emotionRecordings
        case .dream:
            return dreamRecordings
        case .activity:
            return activityRecordings
        case .thought:
            return thoughtRecordings
        }
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
        
        // We update all arrays in the viewModel
        loadAllRecordings() 
    }
    
    func removeRecording<T: Recording>(ofType type: T.Type, withId id: UUID) {
        switch type {
        case is EmotionRecording.Type:
            manager.removeEmotionRecording(withId: id)
            
        case is DreamRecording.Type:
            manager.removeDreamRecording(withId: id)
            
        case is ActivityRecording.Type:
            manager.removeActivityRecording(withId: id)
            
        case is ThoughtRecording.Type:
            manager.removeThoughtRecording(withId: id)
            
        default:
            break
        }
        
        // We update all arrays in the viewModel
        loadAllRecordings()
    }
    
    
}
