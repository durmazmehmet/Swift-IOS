//
//  BukukHayatDongusu.swift
//  deneme_nav
//
//  Created by Mehmet Durmaz on 22.07.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class BuyukHayatDongusuVC: UIViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
   
    override func viewDidLoad() {
        super.viewDidLoad()
        appDel.myOrientation = .landscape
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appDel.myOrientation = .portrait
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        
    }
    
}
