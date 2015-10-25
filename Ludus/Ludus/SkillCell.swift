//
//  SkillCellTableViewCell.swift
//  Ludus
//
//  Created by Kiran Kunigiri on 10/24/15.
//  Copyright © 2015 Ludus Labs. All rights reserved.
//

import UIKit

class SkillCell: UITableViewCell {

    // Properties
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var barView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
