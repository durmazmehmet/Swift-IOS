//
//  ViewController.swift
//  SQLite
//
//  Created by Kaan Aslan on 20.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let fm = FileManager.default
        var url: URL
        
        do {
            url = try fm.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            url.appendPathComponent("test.sqlite")
            print(url.path)
        }
        catch (let err) {
            print(err)
            return
        }

        var dbHandle: OpaquePointer? = nil
        var result: Int32
       
        if !fm.fileExists(atPath: url.path) {
            result = sqlite3_open(url.path, &dbHandle);
            if result != SQLITE_OK {
                print("Cannot open or create SQLite file!")
                return
            }
            
            result = sqlite3_exec(dbHandle, "CREATE TABLE student(student_id INTEGER PRIMARY KEY AUTOINCREMENT, student_name VARCHAR(64), student_no INTEGER)", nil, nil, nil)
            
            if result != SQLITE_OK {
                print("cannot create table!")
                return
            }
            
            let students = ["Özlem Tanış": 234, "Mehmer Er": 76, "Ahmet Çavus": 674,
                            "Ayşe Şen": 734]
            
            for (key, value) in students {
                result = sqlite3_exec(dbHandle, "INSERT INTO student(student_name, student_no) VALUES ('\(key)', \(value))", nil, nil, nil)
                
                if result != SQLITE_OK {
                    print("cannot insert record!")
                    return
                }
            }
            sqlite3_close(dbHandle)
        }
        
        result = sqlite3_open(url.path, &dbHandle);
        if result != SQLITE_OK {
            print("Cannot open or create SQLite file!")
            return
        }
        
        var selectHandle: OpaquePointer? = nil

        result = sqlite3_prepare_v2(dbHandle, "SELECT student_name, student_no FROM student", -1, &selectHandle, nil)
        if result == SQLITE_OK {
            
            while sqlite3_step(selectHandle) == SQLITE_ROW {
                let name = String(cString: sqlite3_column_text(selectHandle, 0)!)
                let no = sqlite3_column_int(selectHandle, 1)
                
                print(name, no)
                
            }
        }
        sqlite3_finalize(selectHandle)
        
        sqlite3_close(dbHandle)
    }
}

