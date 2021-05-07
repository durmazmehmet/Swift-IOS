//
//  ViewController.swift
//  FileOperations
//
//  Created by Kaan Aslan on 23.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    

        let defaults = UserDefaults.standard

        if let names = defaults.array(forKey: "myarray") as? [String] {
            print(names)
        }
        else {
            print("key not found!")
        }
    }
}

