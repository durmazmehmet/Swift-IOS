//
//  SecondViewController.swift
//  GelismisSegue
//
//  Created by Mehmet Durmaz on 31.05.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

// revizyon adım1:
protocol CanReceive {
    func dataReceived(data : String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    var textToPass = " "
    
    // revizyon adım4: CanReceive'nin bir type'ı olarak delege yi oluşturduk (? ile nil olabilir diyerek)
    var delege : CanReceive?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        label.text = textToPass
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        // revizyon adım5: eğer delege nil ise aşağıdaki satır hiç çalışmayacak. eğer delege dolu ise ise FirstVC'deki metoda veri gönderecek
        delege?.dataReceived(data: textField.text!)
        // revizyon adım7: veriyi gönderince secondVC'yi serbest bırakacak
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
