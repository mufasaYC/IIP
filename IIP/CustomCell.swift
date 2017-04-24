//
//  CustomCell.swift
//  IIP
//
//  Created by Ayush Verma on 23/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
