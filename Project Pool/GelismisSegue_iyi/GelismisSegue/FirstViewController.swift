//
//  ViewController.swift
//  GelismisSegue
//
//  Created by Mehmet Durmaz on 31.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

//// revizyon adım2: protokolu burada karşıladık, aşağıda secondVC'de deklare ettiğimiz gibi foksiyonu yazdık
class FirstViewController: UIViewController, CanReceive {

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
    
    @IBAction func maviYap(_ sender: Any) {
        view.backgroundColor = UIColor.brown
        //bu firstVC fabrikasyon mu orjinal mi diye test için
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //işimizi sağlama almış oluyuruz
        //hemde çoklu segue rotalarında faaliyet seçme imkanımız oluyor
        if segue.identifier == "VeriAkisi" {
            let secondVC = segue.destination as! SecondViewController
            //textToPass aslında secondViewControllerde bir değişken
            secondVC.textToPass = textField.text!            
            // revizyon adım6: Second VC'denmetod çağrılında çalışan delegeden veriyi alıp textfielde yerleştirecek
            secondVC.delege = self
        }
    }
    
    // revizyon adım3: second VC'de protokol ile tanıtıp, Bu Fİrst VC'de inherit (miras) alarak conform (uyumladığımız) fonksiyondur kendisi
    func dataReceived(data : String) {
        label.text = data
    }
    
}

