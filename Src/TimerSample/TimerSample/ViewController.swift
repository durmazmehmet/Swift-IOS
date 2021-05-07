//
//  ViewController.swift
//  TimerSample
//
//  Created by Kaan Aslan on 16.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func timerProc(timer: Timer)
    {
        print(".", terminator: "")
    }
    
    @IBAction func buttonOkClicked(_ sender: Any)
    {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerProc)
    }
    
    @IBAction func buttonStopClicked(_ sender: Any)
    {
        timer.invalidate()
    }
}

