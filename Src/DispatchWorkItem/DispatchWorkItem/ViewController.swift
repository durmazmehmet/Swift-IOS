//
//  ViewController.swift
//  DispatchWorkItem
//
//  Created by Kaan Aslan on 16.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dwi: DispatchWorkItem?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func buttonOkClicked(_ sender: Any)
    {
       dwi = DispatchWorkItem {
            for i in 0..<10 {
                print(i)
                sleep(1)
                if self.dwi!.isCancelled {
                    break
                }
            }
        }
        
        DispatchQueue.global().async(execute: dwi!)
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any)
    {
        dwi!.cancel()
    }
}

