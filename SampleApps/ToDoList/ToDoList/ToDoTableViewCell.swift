//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Kaan Aslan on 5.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
