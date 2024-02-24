import Foundation

// Sadly, I'm running out of time to implement this class and pipeline the way I envisionned it. So I'm going bcak to the old basic implementation.
// Because if I had more time, abstraction and agnostic approach would be cleanier than this copy/paste horror.
class RecordingsManager {
    static let shared = RecordingsManager()
    
    private init() {}

    var emotionRecordings: [EmotionRecording] = []
    var dreamRecordings: [DreamRecording] = []
    var activityRecordings: [ActivityRecording] = []
    var thoughtRecordings: [ThoughtRecording] = []

    // Emotion Recordings
    func addEmotionRecording(_ recording: EmotionRecording) {
        emotionRecordings.append(recording)
        saveEmotionRecordings()
    }

    func getEmotionRecordings() -> [EmotionRecording] {
        return emotionRecordings
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

    private func loadThoughtRecordings() {
        if let data = UserDefaults.standard.data(forKey: "ThoughtRecordings"),
           let decoded = try? JSONDecoder().decode([ThoughtRecording].self, from: data) {
            thoughtRecordings = decoded
        }
    }

    // Remove methods for each recording type
    func removeEmotionRecording(at index: Int) {
        emotionRecordings.remove(at: index)
        saveEmotionRecordings()
    }

    func removeDreamRecording(at index: Int) {
        dreamRecordings.remove(at: index)
        saveDreamRecordings()
    }

    func removeActivityRecording(at index: Int) {
        activityRecordings.remove(at: index)
        saveActivityRecordings()
    }

    func removeThoughtRecording(at index: Int) {
        thoughtRecordings.remove(at: index)
        saveThoughtRecordings()
    }

    // Call these load methods at app startup or appropriate place to initialize your data
    func loadAllRecordings() {
        loadEmotionRecordings()
        loadDreamRecordings()
        loadActivityRecordings()
        loadThoughtRecordings()
    }
}
