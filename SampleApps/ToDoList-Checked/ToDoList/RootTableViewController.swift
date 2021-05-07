//
//  RootTableViewController.swift
//  ToDoList
//
//  Created by Kaan Aslan on 5.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {

    var toDoItems = [ToDoItem]()
    var defaults = UserDefaults.standard
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let fm = FileManager.default
        do {
            var url = try fm.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            url.appendPathComponent("toDoList.plist")
            
            if fm.fileExists(atPath: url.path) {
                let data = fm.contents(atPath: url.path)
                
                let pld = PropertyListDecoder()
                toDoItems = try pld.decode([ToDoItem].self, from: data!)
            }
        }
        catch (let err) {
            print(err)
        }
    }

    // MARK: - Table view data source

   
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoList", for: indexPath) as! ToDoTableViewCell
        
        cell.contentLabel.text = toDoItems[indexPath.row].contentText
        cell.dateLabel.text = toDoItems[indexPath.row].dateText
        cell.accessoryType = toDoItems[indexPath.row].checked ? .checkmark : .none
    
        
        
        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let alert = UIAlertAction(title: "Add", style: .default) {
            alertAction in
            let textField = ac.textFields![0]
            if !textField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
                
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy-hh:mm:ss"
                let dt = formatter.string(from: date)
                
                let toDoItem = ToDoItem(textField.text!, dt, false)
                self.toDoItems.append(toDoItem)
                self.tableView.reloadData()
                
                let fm = FileManager.default
                do {
                    let ple = PropertyListEncoder()
                    let data = try ple.encode(self.toDoItems)
                    
                    var url = try fm.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                    url.appendPathComponent("toDoList.plist")
                    try data.write(to: url)
                    print(url)

                }
                catch (let err) {
                    print(err)
                }
                
                
               
            
            }
        }
        ac.addAction(alert)
        ac.addTextField {tf in
            tf.keyboardType = .asciiCapable
        }
        
        self.present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDoItems[indexPath.row].checked = !toDoItems[indexPath.row].checked
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoItems.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
