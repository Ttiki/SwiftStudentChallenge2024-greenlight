import Foundation

class RecordingsManager {
    static let shared = RecordingsManager()
    private init() {}
    
    // Store recordings in a type-agnostic way
    private var recordingsStorage: [String: [Data]] = [:]
    
    // Add a new recording
    func addRecording<T: Recording>(_ recording: T) {
        let key = String(describing: T.self)
        var recordingsForType = recordingsStorage[key] ?? []
        if let encodedRecording = try? JSONEncoder().encode(recording) {
            recordingsForType.append(encodedRecording)
            recordingsStorage[key] = recordingsForType
        }
    }
    
   
    // Remove a recording
    func removeRecording<T: Recording>(ofType type: T.Type, withId id: UUID) {
        let key = String(describing: T.self)
        guard var recordingsForType = recordingsStorage[key] else { return }
        
        // Filter out the recording with the specified ID
        recordingsForType = recordingsForType.compactMap { data -> Data? in
            guard let recording = try? JSONDecoder().decode(T.self, from: data) else { return nil }
            return recording.id == id ? nil : data
        }
        
        // Update the storage with the modified array
        recordingsStorage[key] = recordingsForType
    }
    
    // Retrieve recordings of a specific type
    func getRecordings<T: Recording>(ofType type: T.Type) -> [T] {
        let key = String(describing: T.self)
        guard let encodedRecordings = recordingsStorage[key] else { return [] }
        return encodedRecordings.compactMap { try? JSONDecoder().decode(T.self, from: $0) }
    }
    
    // Save all recordings to persistent storage
    func saveRecordings() {
        let defaults = UserDefaults.standard
        defaults.set(recordingsStorage, forKey: "recordingsStorage")
    }
    
    // Load all recordings from persistent storage
    func loadRecordings() {
        let defaults = UserDefaults.standard
        if let storedRecordingsStorage = defaults.dictionary(forKey: "recordingsStorage") as? [String: [Data]] {
            recordingsStorage = storedRecordingsStorage
        }
    }
}
