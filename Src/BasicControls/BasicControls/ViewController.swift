//
//  ViewController.swift
//  BasicControls
//
//  Created by Kaan Aslan on 20.10.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var cities: [(String, Bool)] = [("Adana", false), ("Sivas", false), ("Eskişehir", false), ("İstanbul", false), ("Ankara", false), ("Edirne", false), ("Sakarya", false), ("Trabzon", false), ("Samsun",  false), ("Balıkesir", false), ("Kars", false), ("Van", false), ("Malatya", false), ("Hatay", false), ("İzmir", false)]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 70
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .blue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mycell")
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 15
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell
    {
        var cell: UITableViewCell
        
        cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        
        if cell.textLabel!.text == nil {
            cell.textLabel!.textColor = .red
            cell.textLabel!.font = UIFont(name: "Arial", size: 20)
        
            let switcher = UISwitch()
            switcher.tag = indexPath.row
            switcher.sizeToFit()
            cell.accessoryView = switcher
            cell.textLabel!.numberOfLines = 5
            cell.textLabel!.textAlignment = .center
            switcher.addTarget(self, action: #selector(onSwitcher(sender:)), for: .valueChanged)
        }
        cell.textLabel!.text = cities[indexPath.row].0
        cell.accessoryView!.tag = indexPath.row
        (cell.accessoryView as! UISwitch).isOn = cities[indexPath.row].1
       
        return cell
    }
    
    @objc
    func onSwitcher(sender: UISwitch)
    {
        cities[sender.tag].1 = sender.isOn
    }
}
