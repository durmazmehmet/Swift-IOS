//
//  MyTableViewCell.swift
//  TableView-CustomCell
//
//  Created by Kaan Aslan on 1.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var uiswitch: UISwitch!
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(_ row: Int)
    {
        switch row % 6 {
        case 0:
            cellImage.image = UIImage(named: "WhitePawn")
        case 1:
            cellImage.image = UIImage(named: "WhiteKnight")
        case 2:
            cellImage.image = UIImage(named: "WhiteBishop")
        case 3:
            cellImage.image = UIImage(named: "WhiteRook")
        case 4:
            cellImage.image = UIImage(named: "WhiteQueen")
        case 5:
            cellImage.image = UIImage(named: "WhiteKing")
            
        default:
            break
        }
    }
    

}
