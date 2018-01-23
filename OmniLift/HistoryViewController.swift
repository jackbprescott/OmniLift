
//
//  HistoryViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var historyTableView: UITableView!
    
    var workoutTypeList: [WorkoutType] = []
    var workoutList: [Workout] = []
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func logOutButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindToLogInFromHistory", sender: nil)
    }
    
    // MARK: - Table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell", for: indexPath) as! HistoryTableViewCell
        cell.workoutNameLabel.text = workoutList[indexPath.row].type.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HistoryToViewWorkout", sender: workoutList[indexPath.row])
    }
    
    // MARK: - Navigation
    
    @IBAction func unwindToHistory(segue:UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let workoutsViewController = segue.destination as? WorkoutsViewController {
            workoutsViewController.workoutTypeList = workoutTypeList
            workoutsViewController.workoutList = workoutList
        }
    }


}
