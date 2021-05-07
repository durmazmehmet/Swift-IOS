//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Mehmet Durmaz on 15.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballOfFortuneImage: UIImageView!
    let answerArray : [UIImage] = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randamAnswer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func askMeButton(_ sender: UIButton) {
        randamAnswer()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        randamAnswer()
    }
    
    func randamAnswer(){
        ballOfFortuneImage.image = answerArray[Int(arc4random_uniform(5))]
    }
    
}

