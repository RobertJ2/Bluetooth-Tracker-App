//
//  BlueTableViewCell.swift
//  Bluetooth Tracker
//
//  Created by Robert Jackson Jr on 6/19/18.
//  Copyright © 2018 Robert Jackson Jr. All rights reserved.
//

import UIKit

class BlueTableViewCell: UITableViewCell {

    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var rssiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
