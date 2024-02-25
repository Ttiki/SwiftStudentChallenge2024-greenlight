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

// Sadly, I'm running out of time to implement this class and pipeline the way I envisionned it. So I'm going bcak to the old basic implementation.
// Because if I had more time, abstraction and agnostic approach would be cleanier than this copy/paste horror.
class RecordingsManager {
    static let shared = RecordingsManager()
    
    private init() {}
    
    var emotionRecordings: [EmotionRecording] = []
    var dreamRecordings: [DreamRecording] = []
    var activityRecordings: [ActivityRecording] = []
    var thoughtRecordings: [ThoughtRecording] = []
    
    // Add a recording to the correct array by providing a recording
    func addRecording(_ recording: any Recording) {
        switch recording {
        case let recording as EmotionRecording:
            emotionRecordings.append(recording)
            saveEmotionRecordings()
        case let recording as DreamRecording:
            dreamRecordings.append(recording)
            saveDreamRecordings()
        case let recording as ActivityRecording:
            activityRecordings.append(recording)
            saveActivityRecordings()
        case let recording as ThoughtRecording:
            thoughtRecordings.append(recording)
            saveThoughtRecordings()
        default:
            print("Unknown recording type")
        }
        
        print("New recording added!")
    }
    
    // Remove a recording by giving it the recording object to delete
    func removeRecording(_ recording: any Recording) {
        if let index = emotionRecordings.firstIndex(where: { $0.id == recording.id }) {
            emotionRecordings.remove(at: index)
            saveEmotionRecordings()
        } else if let index = dreamRecordings.firstIndex(where: { $0.id == recording.id }) {
            dreamRecordings.remove(at: index)
            saveDreamRecordings()
        } else if let index = activityRecordings.firstIndex(where: { $0.id == recording.id }) {
            activityRecordings.remove(at: index)
            saveActivityRecordings()
        } else if let index = thoughtRecordings.firstIndex(where: { $0.id == recording.id }) {
            thoughtRecordings.remove(at: index)
            saveThoughtRecordings()
        }
    }
    
    // Loads all the recordings saved to their respective array
    func loadAllRecordings() {
        loadEmotionRecordings()
        loadDreamRecordings()
        loadActivityRecordings()
        loadThoughtRecordings()
    }
    
    
    // List of CRUDE PER type
    // Emotion Recordings
    func addEmotionRecording(_ recording: EmotionRecording) {
        emotionRecordings.append(recording)
        saveEmotionRecordings()
    }
    
    func getEmotionRecordings() -> [EmotionRecording] {
        return emotionRecordings
    }
    
    func removeEmotionRecording(withId id: UUID) {
        if let index = emotionRecordings.firstIndex(where: { $0.id == id }) {
            emotionRecordings.remove(at: index)
            saveEmotionRecordings()
        }
    }
    func removeEmotionRecording(at index: Int) {
        emotionRecordings.remove(at: index)
        saveEmotionRecordings()
    }
    
    private func saveEmotionRecordings() {
        if let encoded = try? JSONEncoder().encode(emotionRecordings) {
            UserDefaults.standard.set(encoded, forKey: "EmotionRecordings")
        }
    }
    
    private func loadEmotionRecordings() {
        if let data = UserDefaults.standard.data(forKey: "EmotionRecordings"),
           let decoded = try? JSONDecoder().decode([EmotionRecording].self, from: data) {
            emotionRecordings = decoded
        }
    }
    
    // Dream Recordings
    func addDreamRecording(_ recording: DreamRecording) {
        dreamRecordings.append(recording)
        saveDreamRecordings()
    }
    
    func getDreamRecordings() -> [DreamRecording] {
        return dreamRecordings
    }
    
    func removeDreamRecording(withId id: UUID) {
        if let index = dreamRecordings.firstIndex(where: { $0.id == id }) {
            dreamRecordings.remove(at: index)
            saveDreamRecordings()
        }
    }
    func removeDreamRecording(at index: Int) {
        dreamRecordings.remove(at: index)
        saveDreamRecordings()
    }
    
    private func saveDreamRecordings() {
        if let encoded = try? JSONEncoder().encode(dreamRecordings) {
            UserDefaults.standard.set(encoded, forKey: "DreamRecordings")
        }
    }
    
    private func loadDreamRecordings() {
        if let data = UserDefaults.standard.data(forKey: "DreamRecordings"),
           let decoded = try? JSONDecoder().decode([DreamRecording].self, from: data) {
            dreamRecordings = decoded
        }
    }
    
    // Activity Recordings
    func addActivityRecording(_ recording: ActivityRecording) {
        activityRecordings.append(recording)
        saveActivityRecordings()
    }
    
    func getActivityRecordings() -> [ActivityRecording] {
        return activityRecordings
    }
    
    func removeActivityRecording(withId id: UUID) {
        if let index = activityRecordings.firstIndex(where: { $0.id == id }) {
            activityRecordings.remove(at: index)
            saveActivityRecordings()
        }
    }
    func removeActivityRecording(at index: Int) {
        activityRecordings.remove(at: index)
        saveActivityRecordings()
    }
    
    private func saveActivityRecordings() {
        if let encoded = try? JSONEncoder().encode(activityRecordings) {
            UserDefaults.standard.set(encoded, forKey: "ActivityRecordings")
        }
    }
    
    private func loadActivityRecordings() {
        if let data = UserDefaults.standard.data(forKey: "ActivityRecordings"),
           let decoded = try? JSONDecoder().decode([ActivityRecording].self, from: data) {
            activityRecordings = decoded
        }
    }
    
    // Thought Recordings
    func addThoughtRecording(_ recording: ThoughtRecording) {
        thoughtRecordings.append(recording)
        saveThoughtRecordings()
    }
    
    func getThoughtRecordings() -> [ThoughtRecording] {
        return thoughtRecordings
    }
    
    private func saveThoughtRecordings() {
        if let encoded = try? JSONEncoder().encode(thoughtRecordings) {
            UserDefaults.standard.set(encoded, forKey: "ThoughtRecordings")
        }
    }
    
    func removeThoughtRecording(withId id: UUID) {
        if let index = thoughtRecordings.firstIndex(where: { $0.id == id }) {
            thoughtRecordings.remove(at: index)
            saveThoughtRecordings()
        }
    }
    func removeThoughtRecording(at index: Int) {
        thoughtRecordings.remove(at: index)
        saveThoughtRecordings()
    }
    
    private func loadThoughtRecordings() {
        if let data = UserDefaults.standard.data(forKey: "ThoughtRecordings"),
           let decoded = try? JSONDecoder().decode([ThoughtRecording].self, from: data) {
            thoughtRecordings = decoded
        }
    }
}
