//
//  ViewController.swift
//  SampleIOS
//
//  Created by Kaan Aslan on 7.10.2018.
//  Copyright © 2018 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var labelSwitch: UILabel!
    @IBOutlet weak var labelStepper: UILabel!
    
    @IBOutlet weak var switcher: UISwitch!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func onButtonTouchDown(_ sender: Any) {
        
        slider.value = Float(textField.text!)!
    }
    @IBAction func onStepperValueChanged(_ sender: Any) {
        
    labelStepper.text = "\(stepper.value)"
        
    }
    @IBAction func onValueChanged(_ sender: Any)
    {
        label.text = "Value = \(Int(round(slider.value)))"
    }
    @IBAction func onSwitcherValueChanged(_ sender: Any) {
        labelSwitch.text = switcher.isOn ? "Açık" : "Kapalı"
    }
}

