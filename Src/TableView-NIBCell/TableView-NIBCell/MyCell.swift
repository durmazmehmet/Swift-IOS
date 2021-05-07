//
//  MyCell.swift
//  TableView-NIBCell
//
//  Created by Kaan Aslan on 2.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
