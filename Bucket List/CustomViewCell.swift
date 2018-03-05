//
//  CustomViewCell.swift
//  Bucket List
//
//  Created by Erin Wiegman on 2/19/18.
//  Copyright © 2018 Erin Wiegman. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {

    @IBOutlet weak var toDoItem: UILabel!
    @IBOutlet weak var toDoCheck: UIImageView!
    
    @IBOutlet weak var doneItem: UILabel!
    @IBOutlet weak var doneCheck: UIImageView!
    
    @IBOutlet weak var filterCheck: UIImageView!
    @IBOutlet weak var filterItem: UILabel!
    
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
