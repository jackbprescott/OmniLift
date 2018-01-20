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
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Actions
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderButton = sender as? UIButton {
            if senderButton === doneButton, let workoutsViewController = segue.destination as? WorkoutsViewController {
                workoutsViewController.workoutTypeList.append(WorkoutType(workoutNameTextField.text ?? ""))
                workoutsViewController.workoutsTableView.reloadData()
            }
        }
    }

}
