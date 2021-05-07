//
//  ViewController.swift
//  OperationQueueThreading
//
//  Created by Kaan Aslan on 14.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let opq = OperationQueue()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        opq.maxConcurrentOperationCount = 5
        
        for i in 1...10 {
            let mop = MyOperation("Task-\(i)")
            opq.addOperation(mop)
        }
    }
    
    @IBAction func buttonOkClicked(_ sender: Any)
    {
        opq.cancelAllOperations()
        print(opq.operationCount)
        opq.waitUntilAllOperationsAreFinished()
    }
}

