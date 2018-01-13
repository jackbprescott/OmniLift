//
//  Group.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/12/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import Foundation

struct Group {
        
    // MARK: - Properties
    
    var exercises: [Exercise] = []
    var repititions: Int = 1
    
    // MARK: - Setup
    
    init () {
    }
    
    init (exercises: [Exercise]) {
        self.exercises = exercises
    }
    
    // MARK: - Functions
    
    mutating func addExercise (_ exercise: Exercise) {
        exercises.append(exercise)
    }
    
    mutating func setRepititions (_ reps: Int) {
        repititions = reps
    }
    
}

