//
//  LogWorkoutViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class LogWorkoutViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var workoutTypeTitle: UILabel!
    
    var newWorkout: Workout?
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTypeTitle.text = newWorkout!.type.name
    }
    
    

}
