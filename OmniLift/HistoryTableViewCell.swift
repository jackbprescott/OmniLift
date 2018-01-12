//
//  HistoryTableViewCell.swift
//  OmniLift
//
//  Created by Jack Prescott on 1/11/18.
//  Copyright © 2018 Something Clever. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var workoutNameLabel: UILabel!
    
    // MARK: - Setup

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
