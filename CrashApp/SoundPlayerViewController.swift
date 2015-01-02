//
//  SoundPlayerViewController.swift
//  CrashApp
//
//  Created by Tommy Bennett on 1/2/15.
//  Copyright (c) 2015 Tommy Bennett. All rights reserved.


import UIKit
import AVFoundation

class SoundPlayerViewController: UIViewController, AVAudioPlayerDelegate {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Properties
    
    var crash = false
    
    var soundName: String? {
        
        didSet {
            
            if soundName == nil {
                
                return
            }
            
            self.audioPlayer = {
                
                let fileURL = NSBundle.mainBundle().URLForResource(self.soundName!, withExtension: "mp3")
                let audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
                audioPlayer.delegate = self
                audioPlayer.prepareToPlay()
                return audioPlayer
                }()
        }
    }
    
    var audioPlayer: AVAudioPlayer?
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.imageView.hidden = true
    }
    
    // MARK: - Actions
    
    @IBAction func playCrash(sender: AnyObject){
        
        self.audioPlayer?.play()
        self.imageView.hidden = false
    }
    
    // MARK: - AVAudioPlayerDelegate
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        
        self.imageView.hidden = true
        
        if self.crash {
            abort()
        }
    }
    
}

