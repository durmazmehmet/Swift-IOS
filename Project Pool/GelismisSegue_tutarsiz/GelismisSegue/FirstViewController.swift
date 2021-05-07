//
//  ViewController.swift
//  GelismisSegue
//
//  Created by Mehmet Durmaz on 31.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    var geriGelen = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            label.text = geriGelen
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }

    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "VeriAkisi", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //işimizi sağlama almış oluyuruz
        //hemde çoklu segue rotalarında faaliyet seçme imkanımız oluyor
        if segue.identifier == "VeriAkisi" {
            //let secondVC =  SecondViewController() dersek bir obje yaratmış oluruz ki
            //ama aşağıdaki şekilde de öyle oluyor
            //aslında verileri iki VC arasında yollarken veriyi VCnşn bşr kopyasına yolluyoruz. Bu kopyalar biz yaptıkça çoğaliy
            let secondVC = segue.destination as! SecondViewController
            //textToPass aslında secondViewControllerde bir değişken
            secondVC.textToPass = textField.text!
        }
    }
    
}

