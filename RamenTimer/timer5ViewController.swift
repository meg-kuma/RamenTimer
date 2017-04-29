//
//  timer5ViewController.swift
//  RamenTimer
//
//  Created by 目黒将稔 on 2017/04/30.
//  Copyright © 2017年 Masatoshi Meguro. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class timer5ViewController: UIViewController {
    
    @IBOutlet var timerLimit: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
        let tmLabel: Timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.downTimer), userInfo: nil, repeats: true)
        tmLabel.fire()
        
        
    }
    
    func downTimer(_ timer: Timer) {
        
        let df:DateFormatter = DateFormatter()
        df.dateFormat = "mm:ss"
        
        let dt:Date = df.date(from: timerLimit.text!)!
        
        
        let dt2 = Date(timeInterval: -1.0, since: dt)
        self.timerLimit.text = df.string(from: dt2)
        
        if self.timerLimit.text == "00:00" {
            
            timer.invalidate()
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            if let url = Bundle.main.url(forResource: "alarm", withExtension: "mp3") {
                
                do {
                    
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.play()
                    
                } catch {
                    
                    audioPlayer = nil
                    
                }
                
            } else {
                
                fatalError("Url is nil.")
                
            }
            
        }
        
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
    
}
