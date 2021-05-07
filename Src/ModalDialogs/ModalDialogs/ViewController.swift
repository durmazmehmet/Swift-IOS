//
//  ViewController.swift
//  ModalDialogs
//
//  Created by Kaan Aslan on 9.12.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonOkClickHandler(_ sender: Any)
    {
        let ac = UIAlertController(title: "Message", message: "Choose Person", preferredStyle: .actionSheet)
        
        for str in ["Ali", "Veli", "Selami", "Ayşe", "Fatma", "Sacit", "Süleyman", "Sibel", "Suzan", "Hüseyin", "Gürbüz", "Yücel"] {
            ac.addAction(UIAlertAction(title: str, style: .default, handler: nil))
        }
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: alertActionHandler))
       
        
        self.present(ac, animated: true)
    }

    func alertActionHandler(action: UIAlertAction)
    {
        print(action.title!)
    }
}

