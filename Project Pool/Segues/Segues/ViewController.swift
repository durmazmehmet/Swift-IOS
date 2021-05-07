//
//  ViewController.swift
//  Segues
//
//  Created by Mehmet Durmaz on 30.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstViewText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSecondScreen", sender: self)
    }
    
    // birinci viewC'den ikinciye geçişten önce yapılacak iş için
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondScreen" {
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.gecisMetni = firstViewText.text!
        }
    }
    
}

