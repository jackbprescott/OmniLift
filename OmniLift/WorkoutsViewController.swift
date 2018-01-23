//
//  WorkoutsViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var workoutsTableView: UITableView!
    
    var workoutTypeList: [WorkoutType] = []
    var workoutList: [Workout] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutsTableView.delegate = self
        workoutsTableView.dataSource = self
        workoutsTableView.allowsMultipleSelectionDuringEditing = true
        workoutsTableView.reloadData()
    }
    
    // MARK: - Table View Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutTypeList.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        workoutTypeList.remove(at: indexPath.row)
        workoutsTableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workoutsTableView.dequeueReusableCell(withIdentifier: "WorkoutsTableViewCell", for: indexPath) as! WorkoutsTableViewCell
        cell.workoutNameLabel.text = workoutTypeList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "LogWorkoutSegue", sender: workoutTypeList[indexPath.row])
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonAction(_ sender: UIButton) {
    }

    //MARK: - Navigation

    @IBAction func unwindToWorkouts(segue:UIStoryboardSegue) { }
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if let historyViewController = segue.destination as? HistoryViewController {
            historyViewController.workoutTypeList = workoutTypeList
        } else if let logWorkoutViewController = segue.destination as? LogWorkoutViewController, let type = sender as? WorkoutType {
            logWorkoutViewController.newWorkout = Workout(type)
            logWorkoutViewController.workoutList = workoutList
            logWorkoutViewController.workoutTypeList = workoutTypeList
        }
    }

}
