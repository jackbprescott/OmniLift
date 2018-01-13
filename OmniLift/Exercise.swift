//
//  Exercise.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/12/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import Foundation


struct Exercise {
    
    // MARK: - Properties
    
    var name: String
    var isTimed: Bool = false
    
    // MARK: - Setup
    
    init (name: String) {
        self.name = name
    }
    
    init (name: String, isTimed: Bool) {
        self.name = name
        self.isTimed = isTimed
    }
    
}
