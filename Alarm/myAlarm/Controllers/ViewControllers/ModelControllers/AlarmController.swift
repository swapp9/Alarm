//
//  AlarmController.swift
//  myAlarm
//
//  Created by Colton Swapp on 7/27/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class AlarmController {
    
    // MARK: - Shared Instance
    static var sharedInstance = AlarmController()
    
    
    // MARK: - Source of Truth!
    var alarms: [Alarm] = []
    
    var mockAlarms: [Alarm] = {
        let date = Date(timeInterval: 5000, since: Date())
        // let dateAsString = date.formatAsString()
        let alarmA = Alarm(alarmName: "Wake up!", fireDate: date, enabled: false)
        let alarmB = Alarm(alarmName: "Practice", fireDate: date, enabled: false)
        
        return [alarmA, alarmB]
    }()
    
    
    // MARK: - Crud funcs!
    func create(fireDate: Date, name: String, enabled: Bool) {
        let newAlarm = Alarm(alarmName: name, fireDate: fireDate, enabled: enabled)
        alarms.append(newAlarm)
        saveToPersistentStore()
    }
    
    func update(alarm: Alarm, name: String, fireDate: Date, enabled: Bool) {
        alarm.alarmName = name
        alarm.fireDate = fireDate
        alarm.enabled = enabled
        saveToPersistentStore()
        
    }
    
    func delete(alarmToDelete alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        alarms.remove(at: index)
        saveToPersistentStore()
    }
    
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
        saveToPersistentStore()
    }
}

// MARK: - Persistence

func fileURL() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentDirectory = paths[0]
    let filename = "alarms.json"
    let fullURL = documentDirectory.appendingPathComponent(filename)
    return fullURL
    
}

func saveToPersistentStore() {
    
    do {
        let data = try JSONEncoder().encode(AlarmController.sharedInstance.alarms)
        print(data)
        print(String(data: data, encoding: .utf8)!)
        try data.write(to: fileURL())
        
    } catch let error {
        print("Error saving alarm \(error)")
        print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        
    }
    
}

func loadFromPersistentStore() {
    do {
        let data = try Data(contentsOf: fileURL())
        let decodedAlarms = try JSONDecoder().decode([Alarm].self, from: data)
        self.alarms = decodedAlarms
        
    } catch {
        print("Error loading data drom disk \(error)")
        
    }
}
