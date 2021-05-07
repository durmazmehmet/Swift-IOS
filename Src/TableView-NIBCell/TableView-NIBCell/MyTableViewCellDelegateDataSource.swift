//
//  MyTableViewCellDelegateDataSource.swift
//  TableView-NIBCell
//
//  Created by Kaan Aslan on 2.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class MyTableViewCellDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        
        if cell.tag == 0 {
            cell.tag = 1
            cell.myImageView.image = UIImage(named: "WhiteKing")
        }
        cell.myLabel.text = String(indexPath.row)
        
        return cell
    }
}
