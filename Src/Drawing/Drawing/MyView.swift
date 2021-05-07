//
//  MyView.swift
//  Drawing
//
//  Created by Kaan Aslan on 22.02.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class MyView: UIView
{
    override func draw(_ rect: CGRect)
    {
        let gc: CGContext = UIGraphicsGetCurrentContext()!
        
        gc.setFillColor(UIColor.yellow.cgColor)
        gc.saveGState()
        gc.setLineWidth(3)
        gc.setFillColor(UIColor.green.cgColor)
        gc.setStrokeColor(UIColor.blue.cgColor)
        
        gc.addEllipse(in: CGRect(x: 50, y: 50, width: 100, height: 100))
        gc.drawPath(using: .fillStroke)
        
        gc.restoreGState()
        
        gc.addEllipse(in: CGRect(x: 250, y: 250, width: 100, height: 100))
        gc.drawPath(using: .fillStroke)
    }
}
