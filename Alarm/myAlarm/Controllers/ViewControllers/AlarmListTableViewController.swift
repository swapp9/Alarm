//
//  AlarmListTableViewController.swift
//  myAlarm
//
//  Created by Colton Swapp on 7/27/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.sharedInstance.alarms.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? SwitchTableViewCell else { return UITableViewCell()}
        
        let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
        cell.cellDelegate = self
        cell.alarm = alarm

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return view.frame.height / 6
       }
   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alarmToDelete = AlarmController.sharedInstance.alarms[indexPath.row]
            AlarmController.sharedInstance.delete(alarmToDelete: alarmToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
   
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellToDetailView" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? AlarmDetailTableViewController else { return }
            let alarm = AlarmController.sharedInstance.alarms[indexPath.row]
            destinationVC.alarm = alarm
        }
    }
}

extension AlarmListTableViewController : SwitchTableViewCellDelegate {
    func switchCellValueChanged(cell: SwitchTableViewCell) {
        guard let alarm = cell.alarm else { return }
        AlarmController.sharedInstance.toggleEnabled(for: alarm)
        tableView.reloadData()
    }
}


