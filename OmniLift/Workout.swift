//
//  Workout.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/12/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import Foundation

class Workout {
    
    // MARK: - Properties
    
    var name: String
    var groups: [Group] = []
    var currentGroup: Group = Group()
    
    // MARK: - Setup
    
    init (name: String) {
        self.name = name
    }
    
    // MARK: - Functions
    
    func addToCurrentGroup (_ exercise: String) {
        currentGroup.addExercise(exercise)
    }
    
    func setCurrentGroupRepititions (_ reps) {
        currentGroup.setRepititions(reps)
    }
    
    func finishCurrentGroup () {
        groups.append(currentGroup)
        currentGroup = Group()
    }
    
}
