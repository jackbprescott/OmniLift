//
//  CreateWorkoutTableViewCell.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/20/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class CreateWorkoutTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var repsLowerLimitTextField: UITextField!
    @IBOutlet weak var repsUpperLimitTextField: UITextField!
    
    
    // MARK: - Setup

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {

    }

}
