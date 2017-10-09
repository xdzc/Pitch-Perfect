//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Cinfwat Probity on 07/10/2017.
//  Copyright © 2017 Dogak Cinfwat. All rights reserved.
//

import UIKit
import AVFoundation

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
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, highPitch, lowPitch, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        setPlaybackButtonsImageContentMode()
    }
    
    // Sets the playback UIButtons UIImageView's UIViewContentMode to ScaleAspectFit
    // This prevents the playback buttons from appearing squashed in landscape mode.
    func setPlaybackButtonsImageContentMode() {
        let contentMode: UIViewContentMode = .scaleAspectFit
        slowButton.imageView?.contentMode = contentMode
        fastButton.imageView?.contentMode = contentMode
        highPitchButton.imageView?.contentMode = contentMode
        lowPitchButton.imageView?.contentMode = contentMode
        reverbButton.imageView?.contentMode = contentMode
        echoButton.imageView?.contentMode = contentMode
        stopButton.imageView?.contentMode = contentMode
    }
}
