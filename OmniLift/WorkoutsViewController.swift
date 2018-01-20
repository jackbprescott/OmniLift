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
    }
    
    // MARK: - Table View Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutTypeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workoutsTableView.dequeueReusableCell(withIdentifier: "WorkoutsTableViewCell", for: indexPath) as! WorkoutsTableViewCell
        cell.workoutNameLabel.text = workoutTypeList[indexPath.row].name
        return cell
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
        }
    }

}
