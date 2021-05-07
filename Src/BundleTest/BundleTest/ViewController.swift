//
//  ViewController.swift
//  BundleTest
//
//  Created by Kaan Aslan on 26.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let bundlePath: String? = Bundle.main.path(forResource: "Images", ofType: "bundle")
        let bundle: Bundle? = Bundle(path: bundlePath!)
        let url: URL? = bundle!.url(forResource: "AbbeyRoad", withExtension: "jpg")
        imageView.image = UIImage(contentsOfFile:  url!.path)
    }
}

