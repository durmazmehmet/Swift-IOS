//
//  ViewController.swift
//  Calculator
//
//  Created by Kaan Aslan on 22.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var labelNumbers: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onButtonClicked(_ sender: Any)
    {
        let button = sender as! UIButton
        
        labelNumbers.text!.append(button.titleLabel!.text!)
    }
    @IBAction func onButtonAcClicked(_ sender: Any)
    {
        labelNumbers.text! = "0"
    }
  
}

