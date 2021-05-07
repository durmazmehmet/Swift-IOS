//
//  ViewController.swift
//  TableView-NIBCell
//
//  Created by Kaan Aslan on 2.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dds = MyTableViewCellDelegateDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame = self.view.bounds
        self.tableView.delegate = dds
        self.tableView.dataSource = dds
        self.tableView.rowHeight = 150
        self.tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
    }
}

