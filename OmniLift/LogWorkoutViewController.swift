//
//  LogWorkoutViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class LogWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // MARK: - Properties
    
    @IBOutlet weak var workoutTypeTitle: UILabel!
    @IBOutlet weak var logWorkoutTableView: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    
    var newWorkout: Workout?
    var workoutTypeList: [WorkoutType] = []
    var workoutList: [Workout] = []
    
    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutTypeTitle.text = newWorkout!.type.name
        logWorkoutTableView.delegate = self
        logWorkoutTableView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func finishButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "UnwindToHistoryFromLogWorkout", sender: sender)
    }
    
    // MARK: - Text Field Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let indexPathComponents = String(textField.tag).components(separatedBy: "10001")
        
        let type: Int = Int(indexPathComponents[0])!

        let path: IndexPath = IndexPath(row: Int(indexPathComponents[2])!, section: Int(indexPathComponents[1])!)
        
        if type == 1 {
            newWorkout!.repsAndWeightData[path]![0] = textField.text!
        } else if type == 2  {
            newWorkout!.repsAndWeightData[path]![1] = textField.text!
        }
    }
    
    // MARK: - Table View Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newWorkout!.type.groups.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newWorkout!.type.groups[section].exercises.count * newWorkout!.type.groups[section].repititions
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group " + String(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = logWorkoutTableView.dequeueReusableCell(withIdentifier: "LogWorkoutTableViewCell") as! LogWorkoutTableViewCell
        let moduloOfRow = indexPath.row % newWorkout!.type.groups[indexPath.section].exercises.count
        
        cell.exerciseNameLabel.text = newWorkout!.type.groups[indexPath.section].exercises[moduloOfRow].name
        if newWorkout!.repsAndWeightData[indexPath]![0] != "" {
            cell.weightTextField.text = newWorkout!.repsAndWeightData[indexPath]![0]
        }
        
        if newWorkout!.repsAndWeightData[indexPath]![1] != "" {
            cell.repsTextField.text = newWorkout!.repsAndWeightData[indexPath]![1]
        }
        
        cell.weightTextField.delegate = self
        cell.repsTextField.delegate = self
        
        let weightTagPart1 = "110001" + String(indexPath.section)
        let weightTagPart2 = "10001" + String(indexPath.row)
        let repsTagPart1 = "210001" + String(indexPath.section)
        let repsTagPart2 = "10001" + String(indexPath.row)
        
        cell.weightTextField.tag = Int(weightTagPart1 + weightTagPart2)!
        cell.repsTextField.tag = Int(repsTagPart1 + repsTagPart2)!

        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderButton = sender as? UIButton {
            if senderButton === finishButton, let historyViewController = segue.destination as? HistoryViewController {
                newWorkout!.endWorkout()
                workoutList.insert(newWorkout!, at: 0)
                historyViewController.workoutList = workoutList
                historyViewController.workoutTypeList = workoutTypeList
                historyViewController.historyTableView.reloadData()
            }
        }
    }

}
