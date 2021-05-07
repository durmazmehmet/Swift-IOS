//
//  ViewController.swift
//  Dicee
//
//  Created by Mehmet Durmaz on 14.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let diceImageArray : [UIImage] = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    @IBOutlet weak var diceImageViewLeft: UIImageView!
    @IBOutlet weak var diceImageViewRight: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDiceImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
    }
    
    func updateDiceImages(){
        diceImageViewLeft.image = diceImageArray[Int(arc4random_uniform(6))]
        diceImageViewRight.image = diceImageArray[Int(arc4random_uniform(6))]
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}

