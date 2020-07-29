//
//  AlarmDetailTableViewController.swift
//  myAlarm
//
//  Created by Colton Swapp on 7/27/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    @IBOutlet weak var alarmTitleLabel: UITextField!
    @IBOutlet weak var enableButton: UIButton!
    
    // MARK: - Properties
    var alarm : Alarm?
    
    var alarmIsOn : Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func updateViews(for alarm: Alarm) {
        alarmTimePicker.date = alarm.fireDate
        alarmTitleLabel.text = alarm.alarmName
        enableButton.isEnabled = alarm.enabled
        alarmIsOn = alarm.enabled
        
    }
    
    private func updateDetailViews(for alarm: Alarm) {
        alarmTimePicker.date = alarm.fireDate
        alarmTitleLabel.text = alarm.alarmName
        alarmIsOn = alarm.enabled
    }
    
    // MARK: - Actions
    @IBAction func enabledTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = alarmTitleLabel.text else { return }
        let fireDate = alarmTimePicker.date
        if let alarm = alarm {
            AlarmController.sharedInstance.update(alarm: alarm, name: name, fireDate: fireDate, enabled: alarmIsOn)
        } else {
            AlarmController.sharedInstance.create(fireDate: fireDate, name: name, enabled: alarmIsOn)
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
