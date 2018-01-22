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
    
    // MARK: - Setup
    
    init (_ type: WorkoutType) {
        self.type = type
        for i in 0 ..< type.groups.count {
            for j in 0 ..< type.groups[i].repititions * type.groups[i].exercises.count {
                repsAndWeightData[IndexPath(row: j, section: i)] = ["", ""]
            }
        }
    }
    
}

