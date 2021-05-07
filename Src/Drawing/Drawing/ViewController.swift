//
//  ViewController.swift
//  Drawing
//
//  Created by Kaan Aslan on 22.02.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let myView = MyView(frame: self.view.frame)
        myView.backgroundColor = .white
        
        self.view.addSubview(myView)
    }
}
