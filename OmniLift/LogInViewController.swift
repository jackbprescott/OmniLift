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
    
    var workoutList: [Workouts] = []
    
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        if let
    }
    
    // MARK: - Actions
    @IBAction func logInButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "LogInToHistory", sender: nil)
    }
    
    @IBAction func unwindToLogIn(segue: UIStoryboardSegue) {}

}
