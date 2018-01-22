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
    var reps: [Int] = []
    var weight: [Int] = []
    
    // MARK: - Setup
    
    init (_ type: WorkoutType) {
        self.type = type
    }
    
}

