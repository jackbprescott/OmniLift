//
//  ViewWorkoutViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class ViewWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - Properties
    
    @IBOutlet weak var viewWorkoutTableView: UITableView!
    @IBOutlet weak var viewWorkoutCollectionView: UICollectionView!
    @IBOutlet weak var nameAndDateLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    var workout: Workout?
    var workoutList: [Workout] = []
    var filteredWorkouts: [Workout] = []
    var workoutTypeList: [WorkoutType] = []

    // MARK: - Setup
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredWorkouts = workoutList.filter() {
            $0.type.name == workout!.type.name
        }
        
        nameAndDateLabel.text = workout!.type.name + ", " + workout!.date
        lengthLabel.text = workout!.time
        
        viewWorkoutTableView.delegate = self
        viewWorkoutTableView.dataSource = self
        viewWorkoutCollectionView.delegate = self
        viewWorkoutCollectionView.dataSource = self
    }
    
    // MARK: - Actions
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table View Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout!.repsAndWeightData[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workout!.repsAndWeightData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group " + String(section + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = viewWorkoutTableView.dequeueReusableCell(withIdentifier: "ViewWorkoutTableViewCell", for: indexPath) as! ViewWorkoutTableViewCell
        cell.exerciseNameLabel.text = workout!.type.groups[indexPath.section].exercises[indexPath.row].name
        cell.weightLabel.text = workout!.repsAndWeightData[indexPath.section][indexPath.row][0] + " lbs"
        cell.repsLabel.text = workout!.repsAndWeightData[indexPath.section][indexPath.row][1] + " reps"
        return cell
    }
    
    // MARK: - Collection View Functions
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredWorkouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = viewWorkoutCollectionView.dequeueReusableCell(withReuseIdentifier: "ViewWorkoutCollectionViewCell", for: indexPath) as! ViewWorkoutCollectionViewCell
        cell.dateLabel.text = filteredWorkouts[indexPath.row].date
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        workout = filteredWorkouts[indexPath.row]
        nameAndDateLabel.text = workout!.type.name + ", " + workout!.date
        lengthLabel.text = workout!.time
        viewWorkoutTableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
