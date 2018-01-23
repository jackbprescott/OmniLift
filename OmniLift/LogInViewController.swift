//
//  LogInViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Properties
    
    var workoutTypeList: [WorkoutType] = []
    var workoutList: [Workout] = []
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        let workoutType1 = WorkoutType("Leg Day")
        let workoutType2 = WorkoutType("Pull Day")
        let workoutType3 = WorkoutType("Push Day")
        workoutTypeList = [workoutType1, workoutType2, workoutType3]
        let workout1 = Workout(workoutType1)
        let workout2 = Workout(workoutType3)
        let workout3 = Workout(workoutType2)
        workout1.date = "04/20/1998"
        workout1.time = "1:42:35"
        workoutList = [workout1, workout2, workout3]
    }
    
    // MARK: - Actions
    @IBAction func logInButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "LogInToHistory", sender: nil)
    }
    
    // MARK: - Navigations
    
    @IBAction func unwindToLogIn(segue: UIStoryboardSegue) {}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let historyViewController = segue.destination as? HistoryViewController {
            historyViewController.workoutTypeList = workoutTypeList
            historyViewController.workoutList = workoutList
        }
    }

}
