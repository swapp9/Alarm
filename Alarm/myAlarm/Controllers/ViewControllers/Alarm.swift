//
//  Alarm.swift
//  myAlarm
//
//  Created by Colton Swapp on 7/27/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import Foundation

class Alarm : Codable {
    
    var alarmName: String
    var fireDate: Date
    var enabled: Bool
    var uuid: String
    var fireTimeAsString: String {
        return fireDate.formatAsString()
    }
    
    init(alarmName: String, fireDate: Date, enabled: Bool, uuid: String = UUID().uuidString) {
        
        self.alarmName = alarmName
        self.fireDate = fireDate
        self.enabled = enabled
        self.uuid = uuid
        
    }
}

extension Alarm : Equatable {
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        return lhs.alarmName == rhs.alarmName && lhs.fireDate == rhs.fireDate && lhs.enabled == rhs.enabled && lhs.uuid == rhs.uuid
    }
}
