//
//  ViewController.swift
//  DrawingImage
//
//  Created by Kaan Aslan on 1.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 375, height: 647))
        
        let image = renderer.image {
            context in
            context.cgContext.addEllipse(in: CGRect(x: 50, y: 50, width: 100, height: 100))
            context.cgContext.move(to: CGPoint(x: 100, y: 100))
            context.cgContext.addLine(to: CGPoint(x: 150, y: 100))
            context.cgContext.addEllipse(in: CGRect(x:0, y:0, width: 20, height: 20))
            context.cgContext.strokePath()
        }
        
        imageView.image = image
        button.setImage(image, for: .normal)
    }
}

