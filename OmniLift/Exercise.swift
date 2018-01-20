//
//  Exercise.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/12/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import Foundation


class Exercise {
    
    // MARK: - Properties
    
    var name: String?
    var repsLowerLimit: String?
    var repsUpperLimit: String?
    
    // MARK: - Setup
    
    init () {
    }
    
    init (name: String, lower: String, upper: String) {
        self.name = name
        self.repsLowerLimit = lower
        self.repsUpperLimit = upper
    }
    
}
