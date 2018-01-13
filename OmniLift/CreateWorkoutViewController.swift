//
//  CreateWorkoutViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var workoutNameTextField: UITextField!
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        workoutList.append(Workout(workoutNameTextField.text ?? ""))
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

}
