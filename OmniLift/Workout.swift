//
//  WorkoutInstance.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/20/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import Foundation

class Workout {
    
    // MARK: - Properties
    
    var type: WorkoutType
    var repsAndWeightData: [IndexPath: [String]] = [:] // IndexPath: [weights, reps]
    var date: String
    var startSecondsSince1970: Int
    var time: String = ""
    
    // MARK: - Setup
    
    init (_ type: WorkoutType) {
        self.type = type
        for i in 0 ..< type.groups.count {
            for j in 0 ..< type.groups[i].repititions * type.groups[i].exercises.count {
                repsAndWeightData[IndexPath(row: j, section: i)] = ["", ""]
            }
        }
        let unformattedDate = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: unformattedDate)
        let month = calendar.component(.month, from: unformattedDate)
        let day = calendar.component(.day, from: unformattedDate)
        
        date = String(month) + "/" + String(day) + "/" + String(year)
        
        startSecondsSince1970 = Int(unformattedDate.timeIntervalSince1970)
    }
    
    // MARK: - Functions
    
    func endWorkout() {
        let endSecondsSince1970: Int = Int(Date().timeIntervalSince1970)
        let elapsedSeconds = endSecondsSince1970 - startSecondsSince1970
        let workoutTimeInMinutes = elapsedSeconds/60
        let workoutHours = String(workoutTimeInMinutes/60)
        var workoutMins = String(workoutTimeInMinutes % 60)
        var workoutSecs = String(elapsedSeconds % 60)
        
        if workoutSecs.count == 1 {
            workoutSecs = "0" + workoutSecs
        }
        
        if workoutHours == "0" {
            time = workoutMins + ":" + workoutSecs
        } else {
            if workoutMins.count == 1 {
                workoutMins = "0" + workoutMins
            }
            time = workoutHours + ":" + workoutMins + ":" + workoutSecs
        }
    }
    
}

