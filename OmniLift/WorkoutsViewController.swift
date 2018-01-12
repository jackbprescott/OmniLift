//
//  WorkoutsViewController.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Properties
    @IBOutlet weak var workoutsTableView: UITableView!
    
    var workoutList: [String] = ["Workout 1", "Workout 2", "Workout 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutsTableView.delegate = self
        workoutsTableView.dataSource = self
    }
    
    //MARK: - Table View Functions

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = workoutsTableView.dequeueReusableCell(withIdentifier: "WorkoutsTableViewCell", for: indexPath) as! WorkoutsTableViewCell
        cell.workoutNameLabel.text = workoutList[indexPath.row]
        return cell
    }

    /*
    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
