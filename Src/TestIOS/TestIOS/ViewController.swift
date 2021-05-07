//
//  ViewController.swift
//  TestIOS
//
//  Created by Kaan Aslan on 13.10.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        let myview = MyView(frame: CGRect(x: 50, y: 150, width: 150, height: 150))
        myview.backgroundColor = UIColor.yellow
        self.view.addSubview(myview)
    }
}

class MyView : UIView
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override init(frame rect: CGRect)
    {
        super.init(frame: rect)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("began")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("ended")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        print("moved")
    }
}

