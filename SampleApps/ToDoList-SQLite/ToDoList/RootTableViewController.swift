//
//  RootTableViewController.swift
//  ToDoList
//
//  Created by Kaan Aslan on 5.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import SQLite3

class RootTableViewController: UITableViewController {

    var toDoList: [ToDoItem] = []
    var defaults = UserDefaults.standard
    var dbHandle: OpaquePointer? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var result: Int32
        
        let url: URL? = Bundle.main.url(forResource: "todolist", withExtension: "sqlite")
        
        result = sqlite3_open(url?.path, &dbHandle);
        if result != SQLITE_OK {
            print("Cannot open or create SQLite file!")
            return
        }
        
        var selectHandle: OpaquePointer? = nil
        result = sqlite3_prepare_v2(dbHandle, "SELECT id, content_text FROM todolist", -1, &selectHandle, nil)
        if result == SQLITE_OK {
            
            while sqlite3_step(selectHandle) == SQLITE_ROW {
                let id =  sqlite3_column_int(selectHandle, 0)
                let contentText = String(cString: sqlite3_column_text(selectHandle, 1)!)
                
                toDoList.append(ToDoItem(contentText, Int(id)))
            }
        }
        sqlite3_finalize(selectHandle)

    }

    // MARK: - Table view data source

    @IBAction func deleteButtonClicked(_ sender: UIButton)
    {
        var result: Int32
        result = sqlite3_exec(self.dbHandle, "DELETE FROM todolist WHERE id = \(toDoList[sender.tag].dbId)", nil, nil, nil)
        
        if result != SQLITE_OK {
            print("cannot delete record!")
            return
        }
        
        toDoList.remove(at: sender.tag)
        tableView.reloadData()
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
        cell.contentLabel.text = toDoList[indexPath.row].contentText
        cell.buttonDelete.tag = indexPath.row
        
        return cell
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let ac = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let alert = UIAlertAction(title: "Add", style: .default) {
            alertAction in
            let textField = ac.textFields![0]
            if !textField.text!.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
                var result: Int32
                result = sqlite3_exec(self.dbHandle, "INSERT INTO todolist(content_text) VALUES ('\(textField.text!)')", nil, nil, nil)
                
                if result != SQLITE_OK {
                    print("cannot insert record!")
                    return
                }
                
                let insertedId = sqlite3_last_insert_rowid(self.dbHandle)
                
                self.toDoList.append(ToDoItem(textField.text!, Int(insertedId)))
                self.tableView.reloadData()
            }
        }
        ac.addAction(alert)
        ac.addTextField {tf in
            tf.keyboardType = .asciiCapable
        }
        
        self.present(ac, animated: true)
    }
    
    struct ToDoItem {
        var contentText: String
        var dbId: Int
        
        init(_ contentText: String, _ dbId: Int)
        {
            self.contentText = contentText
            self.dbId = dbId
        }
    }
}
