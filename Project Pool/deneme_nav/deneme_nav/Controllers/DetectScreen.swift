//
//  DetectScreen.swift
//  deneme_nav
//
//  Created by Mehmet Durmaz on 23.07.2018.
//  Copyright © 2018 Mehmet Durmaz. All rights reserved.
//

import UIKit

class DetectScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            performSegue(withIdentifier: "toIPhone", sender: self)
        case .pad:
            performSegue(withIdentifier: "toIPad", sender: self)
        case .unspecified:
            print("bilemedim")
        case .tv:
            print("tv")
        case .carPlay:
            print("carplay")
        }
    }

}
