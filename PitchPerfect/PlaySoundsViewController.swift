//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Cinfwat Probity on 07/10/2017.
//  Copyright © 2017 Dogak Cinfwat. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL: URL!
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("play sound for button pressed")
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        print("stop audio button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
