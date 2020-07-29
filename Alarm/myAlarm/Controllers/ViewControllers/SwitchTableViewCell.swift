//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by Colton Swapp on 7/27/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate : class {
    func switchCellValueChanged(cell: SwitchTableViewCell)
}

class SwitchTableViewCell: UITableViewCell {

    
    // MARK: - Outlets
    @IBOutlet weak var alarmNameLabel: UILabel!
    
    @IBOutlet weak var alarmTimeLabel: UILabel!
    
    @IBOutlet weak var alarmTriggeredSwitch: UISwitch!
    
    
    // MARK: - Properties
    weak var cellDelegate : SwitchTableViewCellDelegate?
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Actions
    @IBAction func switchValueChanged(_ sender: Any) {
        guard let cellDelegate = cellDelegate else { return }
        cellDelegate.switchCellValueChanged(cell: self)
    }
 
    func updateViews() {
        guard let alarm = alarm else { return }
        alarmNameLabel.text = alarm.alarmName
        alarmTimeLabel.text = alarm.fireTimeAsString
        alarmTriggeredSwitch.isOn = alarm.enabled
    }
}
