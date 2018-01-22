//
//  LogWorkoutTableViewCell.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/22/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class LogWorkoutTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var exerciseNameLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var repsTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
