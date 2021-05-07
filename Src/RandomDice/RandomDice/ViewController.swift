//
//  ViewController.swift
//  RandomDice
//
//  Created by Kaan Aslan on 7.10.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var imageViewDice1: UIImageView!
    
    @IBOutlet weak var imageViewDice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onRollTouchDown(_ sender: Any)
    {
        var a: Int, b: Int
        
        a = Int.random(in: 1...6)
        b = Int.random(in: 1...6)
        
        let diceNames = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        
        imageViewDice1.image = UIImage(named: diceNames[a - 1])
        imageViewDice2.image = UIImage(named: diceNames[b - 1])
        
        
    }
}
