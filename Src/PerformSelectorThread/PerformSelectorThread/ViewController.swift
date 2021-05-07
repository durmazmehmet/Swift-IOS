//
//  ViewController.swift
//  PerformSelectorThread
//
//  Created by Kaan Aslan on 14.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @objc
    func foo(_ name: String)
    {
        autoreleasepool {
            for i in 0..<10 {
                print(i)
                sleep(1)
            }
        }
    }

    @IBAction func buttonRunClicked(_ sender: Any)
    {
        self.performSelector(inBackground: #selector(foo), with: "Test")
    }
}

