//
//  CustomViewCell.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
/////////////////////////
//    outlets--------------------------------------------
/////////////////////////
    @IBOutlet weak var toDoItem: UILabel!
    @IBOutlet weak var toDoCheck: UIImageView!
    @IBOutlet weak var toDoDetails: UIButton!
    
    @IBOutlet weak var newItem: UILabel!
    @IBOutlet weak var newCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
