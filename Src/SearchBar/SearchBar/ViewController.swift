//
//  ViewController.swift
//  SearchBar
//
//  Created by Kaan Aslan on 9.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonOkClickHandler(_ sender: Any)
    {
        let ac = UIAlertController(title: "Message", message: searchBar.text!, preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(ac, animated: true, completion: nil)
        
        
    }
    
}

