//
//  ViewController.swift
//  Timer
//
//  Created by Kaan Aslan on 16.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer: Timer!
    var count: Int = 60
    var counterFlag = true
    
    @IBOutlet weak var labelCounter: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerProc)
    }

    func timerProc(timer: Timer)
    {
        if count > 0 && counterFlag {
            count -= 1
            labelCounter.text = String(count)
        }
        
    }
    
    @IBAction func buttonPlusClicked(_ sender: Any)
    {
        count += 10
        if count > 60 {
            count = 60
        }
        labelCounter.text = String(count)
    }
    
    @IBAction func buttonResetClicked(_ sender: Any)
    {
        count = 60
        labelCounter.text = String(count)
    }
    
    @IBAction func buttonMinusClicked(_ sender: Any)
    {
        count -= 10
        if count < 0 {
            count = 0
        }
        labelCounter.text = String(count)
    }
    
    @IBAction func buttonPlayClicked(_ sender: Any)
    {
        counterFlag = true
    }
    
    @IBAction func buttonPauseClicked(_ sender: Any)
    {
        counterFlag = false
    }
}

