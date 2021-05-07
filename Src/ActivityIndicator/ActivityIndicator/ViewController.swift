//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Kaan Aslan on 22.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ai: UIActivityIndicatorView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        ai = UIActivityIndicatorView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        
        ai.style = .white
        ai.hidesWhenStopped = false
        ai.color = .blue
        self.view.addSubview(ai)
    }
    
    @IBAction func startButtonClicked(_ sender: Any)
    {
        ai.startAnimating()
    }
    @IBAction func stopButtonClicked(_ sender: Any)
    {
        ai.stopAnimating()
    }
}

