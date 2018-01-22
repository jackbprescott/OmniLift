//
//  CreateWorkoutViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // MARK: - Properties
    
    @IBOutlet weak var workoutNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var repititionPickerView: UIPickerView!
    @IBOutlet weak var addExerciseToGroupButton: UIButton!
    @IBOutlet weak var createWorkoutTableView: UITableView!
    
    var groupList: [Group] = []
    var exerciseMatrix: [[Exercise]] = []
    var tags:[String] = []
    
    // MARK: - Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        repititionPickerView.delegate = self
        repititionPickerView.dataSource = self
        createWorkoutTableView.delegate = self
        createWorkoutTableView.dataSource = self
        addExerciseToGroupButton.isEnabled = false
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if workoutNameTextField.text != "" {
            performSegue(withIdentifier: "unwindToWorkoutsSegue", sender: sender)
        }
        let addWorkoutNameAlert = UIAlertController(title: "Please add a workout name", message: nil, preferredStyle: .alert)
        addWorkoutNameAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        present(addWorkoutNameAlert, animated: true, completion: nil)
    }
    
    @IBAction func newGroupAction(_ sender: UIButton) {
        groupList.append(Group(repititionPickerView.selectedRow(inComponent: 0)+1))
        exerciseMatrix.append([])
        addExerciseToGroupAction(addExerciseToGroupButton)
        addExerciseToGroupButton.isEnabled = true
        createWorkoutTableView.reloadData()
    }
    
    @IBAction func addExerciseToGroupAction(_ sender: UIButton) {
        exerciseMatrix[exerciseMatrix.count-1].append(Exercise())
        createWorkoutTableView.reloadData()
    }
    
    // MARK: - Text Field Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        
        let indexPath = String(textField.tag).components(separatedBy: "10001")
        let section: Int = Int(indexPath[1])!
        let row: Int = Int(indexPath[2])!
        let type: Int = Int(indexPath[0])!
        
        if type == 1 {
            exerciseMatrix[section][row].name = textField.text
        } else if type == 2 {
            exerciseMatrix[section][row].repsLowerLimit = textField.text
        } else {
            exerciseMatrix[section][row].repsUpperLimit = textField.text
        }
    }
    
    // MARK: - Picker View Functions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 24
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row+1)
    }
    
    // MARK: - Table View Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group " + String(section+1) + " (x" + String(groupList[section].repititions) + ")"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if groupList.count == 0 {
            return 0
        }
        return exerciseMatrix[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = createWorkoutTableView.dequeueReusableCell(withIdentifier: "CreateWorkoutTableViewCell") as! CreateWorkoutTableViewCell
        
        cell.nameTextField.text = exerciseMatrix[indexPath.section][indexPath.row].name
        cell.repsLowerLimitTextField.text = exerciseMatrix[indexPath.section][indexPath.row].repsLowerLimit
        cell.repsUpperLimitTextField.text = exerciseMatrix[indexPath.section][indexPath.row].repsUpperLimit
        cell.nameTextField.delegate = self
        
        cell.repsLowerLimitTextField.delegate = self
        cell.repsUpperLimitTextField.delegate = self
        
        let nameTagPart1 = "110001" + String(indexPath.section)
        let nameTagPart2 = "10001" + String(indexPath.row)
        let repsLowerTagPart1 = "210001" + String(indexPath.section)
        let repsLowerTagPart2 = "10001" + String(indexPath.row)
        let repsUpperTagPart1 = "310001" + String(indexPath.section)
        let repsUpperTagPart2 = "10001" + String(indexPath.row)
        
        cell.nameTextField.tag = Int(nameTagPart1 + nameTagPart2)!
        cell.repsLowerLimitTextField.tag = Int(repsLowerTagPart1 + repsLowerTagPart2)!
        cell.repsUpperLimitTextField.tag = Int(repsUpperTagPart1 + repsUpperTagPart2)!
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let senderButton = sender as? UIButton {
            if senderButton === saveButton, let workoutsViewController = segue.destination as? WorkoutsViewController {
                let newWorkoutType: WorkoutType = WorkoutType(workoutNameTextField.text!)
                newWorkoutType.groups = groupList
                workoutsViewController.workoutTypeList.append(newWorkoutType)
                workoutsViewController.workoutsTableView.reloadData()
            }
        }
    }

}
