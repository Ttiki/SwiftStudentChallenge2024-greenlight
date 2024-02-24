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


class RecordingViewModel: ObservableObject {
    private let manager = RecordingsManager.shared
    @Published var selectedRecordingType: RecordingType?
    
    // Temporary storage for fetched recordings, to be used by the view
    @Published var emotionRecordings: [EmotionRecording] = []
    @Published var dreamRecordings: [DreamRecording] = []
    @Published var thoughtecordings: [ThoughtRecording] = []
    @Published var activityRecordings: [ActivityRecording] = []
    
    @Published var recordings: [Recording] = []
    
    
    // Because of a lack of time, I will implement this raw
    // way of fetching the correct data, which render my abstract
    // code rather useless and too complex to end on a note like
    // that. In a future update, a better implementation should be
    // written!
    func fetchEmotionRecordings() {
        emotionRecordings = manager.getRecordings(ofType: EmotionRecording.self)
    }
    func fetchDreamRecordings() {
        dreamRecordings = manager.getRecordings(ofType: DreamRecording.self)
    }
    func fetchThoughtRecordings() {
        thoughtecordings = manager.getRecordings(ofType: ThoughtRecording.self)
    }
    func fetchActivityRecordings() {
        activityRecordings = manager.getRecordings(ofType: ActivityRecording.self)
    }
    
    // Assuming Recording conforms to Identifiable for use in ForEach
    func fetchRecordings<T: Recording>(ofType type: T.Type) {
        recordings = recordingsManager.getRecordings(ofType: type)
    }
    
    func removeRecording(at offsets: IndexSet) {
        // Example deletion logic, adjust according to your data structure and requirements
        for index in offsets {
            let recordingToRemove = recordings[index]
            // Assuming a method to delete a recording by ID exists in RecordingsManager
            manager.removeRecording(ofType: type(of: recordingToRemove), withId: recordingToRemove.id)
        }
        // Refresh the recordings list after deletion
        fetchRecordings(ofType: T.self) // Adjust the type parameter according to your setup
    }
    
    func selectRecordingType(_ type: RecordingType) {
        selectedRecordingType = type
        // Potentially load or refresh recordings based on the selected type
    }
    
    func addNewRecording<T: Recording>(_ recording: T) {
        manager.addRecording(recording)
        // Trigger any necessary updates or reloading of data
    }
    
    func removeRecording<T: Recording>(ofType type: T.Type, withId id: UUID) {
        manager.removeRecording(ofType: type, withId: id)
        // Notify the view of changes as necessary, such as reloading data
    }
    
    
    
}
