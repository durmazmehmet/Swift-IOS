//
//  ViewController.swift
//  Xylophone
//
//  Created by Kaan Aslan on 27.01.2019.
//  Copyright © 2019 CSD. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var urlNoteA, urlNoteB, urlNoteC, urlNoteD, urlNoteE, urlNoteF, urlNoteG: URL?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        urlNoteA = Bundle.main.url(forResource: "note-a", withExtension: "wav")
        urlNoteB = Bundle.main.url(forResource: "note-b", withExtension: "wav")
        urlNoteC = Bundle.main.url(forResource: "note-c", withExtension: "wav")
        urlNoteD = Bundle.main.url(forResource: "note-d", withExtension: "wav")
        urlNoteE = Bundle.main.url(forResource: "note-e", withExtension: "wav")
        urlNoteF = Bundle.main.url(forResource: "note-f", withExtension: "wav")
        urlNoteG = Bundle.main.url(forResource: "note-g", withExtension: "wav")
    }

    @IBAction func buttonClicked(_ sender: UIButton)
    {
        var soundId: SystemSoundID = 0
        var url: URL?

        switch (sender.tag) {
        case 1:
            url = urlNoteC
        case 2:
            url = urlNoteD
        case 3:
            url = urlNoteE
        case 4:
            url = urlNoteF
        case 5:
            url = urlNoteG
        case 6:
            url = urlNoteA
        case 7:
            url = urlNoteB
        case 8:
            url = urlNoteC
        default:
           break
        }
        AudioServicesCreateSystemSoundID(url! as CFURL, &soundId)
        AudioServicesPlaySystemSoundWithCompletion(soundId) {
            AudioServicesDisposeSystemSoundID(soundId)
            print(soundId)
        }
    }
}

