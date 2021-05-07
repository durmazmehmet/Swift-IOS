//
//  ViewController.swift
//  VideoPlaying
//
//  Created by Kaan Aslan on 15.02.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    var avController: AVPlayerViewController!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
   
    @IBAction func launchButtonClicked(_ sender: Any)
    {
        /*
        let url = Bundle.main.url(forResource: "DontLetMeDown", withExtension:"mp4")
        
        let avController: AVPlayerViewController = AVPlayerViewController()
        avController.player = AVPlayer(url: url!)
        self.present(avController, animated: true)
    */
      
        let url = Bundle.main.url(forResource: "DontLetMeDown", withExtension:"mp4")
        avController = AVPlayerViewController()
        avController.player = AVPlayer(url: url!)
        avController.player?.rate = 1
        avController.view.frame = CGRect(x: 10, y: 50, width: 400, height: 300)
        self.addChild(avController)
        self.view.addSubview(avController.view)
        avController.view.backgroundColor = .blue
        
        let labelName = UILabel(frame: CGRect(x: 150, y: 0, width: 200, height: 50))
        labelName.textColor = .white
        labelName.text = "Don't Let Me Down"
        avController.view.addSubview(labelName)
    }

    @IBAction func okButtonClicked(_ sender: Any)
    {
        //print(avController!.player!.currentTime().seconds)
        //avController!.player!.isMuted = !avController!.player!.isMuted
        
        avController!.player!.volume += 0.1
    }

    @IBAction func seekButtonClicked(_ sender: Any)
    {
        avController!.player!.seek(to: CMTime(seconds: 50, preferredTimescale: 1))
    }
}
