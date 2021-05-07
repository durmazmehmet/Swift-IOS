//
//  RootTableViewController.swift
//  ToDoList
//
//  Created by Kaan Aslan on 5.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

    var toDoList: [String] = []
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //bleView.rowHeight = 100
        
        if let array = defaults.array(forKey: "toDoList") as? [String] {
            toDoList = array
        }
        
        let fm = FileManager.default
        
        do {
            let url = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        print(url)
        } catch {
            print("\(error)")
        }

    }

    // MARK: - Table view data source

    @IBAction func deleteButtonClicked(_ sender: UIButton)
    {
        toDoList.remove(at: sender.tag)
        tableView.reloadData()
        self.defaults.set(self.toDoList, forKey: "toDoList")
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoList", for: indexPath) as! ToDoTableViewCell
       
        cell.contentLabel.numberOfLines = 5
        cell.contentLabel.text = toDoList[indexPath.row]
        cell.buttonDelete.tag = indexPath.row
        
        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let alert = UIAlertAction(title: "Add", style: .default) {
            alertAction in
            let textField = ac.textFields![0]
            if !textField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
                self.toDoList.append(textField.text!)
                print(self.toDoList)
                self.tableView.reloadData()
                
                self.defaults.set(self.toDoList, forKey: "toDoList")
            }
        }
        ac.addAction(alert)
        ac.addTextField {tf in
            tf.keyboardType = .asciiCapable
        }
        
        self.present(ac, animated: true)
    }
    
   
}
