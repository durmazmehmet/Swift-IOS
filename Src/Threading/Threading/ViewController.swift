//
//  ViewController.swift
//  Threading
//
//  Created by Kaan Aslan on 1.03.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var progressView: UIProgressView!
    
    let semProducer = DispatchSemaphore(value:1)
    let semConsumer = DispatchSemaphore(value:0)
    var shared = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        progressView.progress = 0
    }

    @IBAction func onButtonClicked(_ sender: Any)
    {
        DispatchQueue.global(qos: .default).async(execute: producerFunc)
        DispatchQueue.global(qos: .default).async(execute: consumerFunc)
            
    }
    
    func producerFunc()
    {
        var i = 0
        
        while true {
            usleep(useconds_t(Int.random(in: 100000...300000)))
            semProducer.wait()
            shared = i
            semConsumer.signal()
            if i == 99 {
                break
            }
            i += 1
        }
    }
    
    func consumerFunc()
    {
        var val: Int
        
        while true {
            semConsumer.wait()
            val = shared
            semProducer.signal()
            usleep(useconds_t(Int.random(in: 100000...300000)))
            print(val, terminator: " ")
            if val == 99 {
                break
            }
        }
        print()
    }
}

