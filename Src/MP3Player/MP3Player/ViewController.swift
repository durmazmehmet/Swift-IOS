//
//  ViewController.swift
//  MP3Player
//
//  Created by Kaan Aslan on 3.02.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var avPlayer: AVAudioPlayer!
    var pauseFlag: Bool = true
    @IBOutlet weak var pausePlayButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "DontLetMeDown", withExtension:"mp3")
        
        avPlayer =  try? AVAudioPlayer(contentsOf: url!)
        avPlayer.prepareToPlay()
        guard avPlayer != nil else {return}
    }

    @IBAction func puasePlayClickHandler(_ sender: Any)
    {
        if pauseFlag {
            avPlayer.play()
            pausePlayButton.setImage(UIImage(named: "Pause"), for: .normal)
            pauseFlag = false
        }
        else {
            avPlayer.pause()
            pausePlayButton.setImage(UIImage(named: "Play"), for: .normal)
            pauseFlag = true
        }
    }
}

