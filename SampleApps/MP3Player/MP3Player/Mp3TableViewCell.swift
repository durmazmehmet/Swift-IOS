//
//  Mp3TableViewCell.swift
//  MP3Player
//
//  Created by Kaan Aslan on 9.02.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import AVFoundation

class Mp3TableViewCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var startStop: UIButton!
    static var avPlayer: AVAudioPlayer!
    static var playingTag = -1
    static var lastButton: UIButton!
    var pauseFlag = false
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func startStopDown(_ sender: UIButton)
    {
        if sender.tag != Mp3TableViewCell.playingTag {
            if Mp3TableViewCell.avPlayer != nil {
                Mp3TableViewCell.avPlayer.stop()
                
            }
            Mp3TableViewCell.avPlayer =  try? AVAudioPlayer(contentsOf: cellInfo[sender.tag].url)
            Mp3TableViewCell.avPlayer.prepareToPlay()
            guard Mp3TableViewCell.avPlayer != nil else {return}
            Mp3TableViewCell.avPlayer.play()
            Mp3TableViewCell.playingTag = sender.tag
            
            if Mp3TableViewCell.lastButton != nil {
                Mp3TableViewCell.lastButton.setImage(UIImage(named: "Play"), for: .normal)
                pauseFlag = false;
            }
            Mp3TableViewCell.lastButton = sender
            
        }
        
        if pauseFlag {
            Mp3TableViewCell.avPlayer.pause()
            startStop.setImage(UIImage(named: "Play"), for: .normal)
            pauseFlag = false
            
        }
        else {
            Mp3TableViewCell.avPlayer.play()
            startStop.setImage(UIImage(named: "Pause"), for: .normal)
            
            pauseFlag = true
        }
    
    }
}

struct CellInfo {
    var songName: String
    var url: URL
}
