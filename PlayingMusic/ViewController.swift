//
//  ViewController.swift
//  PlayingMusic
//
//  Created by Minh Tuan on 6/7/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var btn_Play: UIButton!
    
    @IBOutlet weak var sld_volume: UISlider!
    var audio = AVAudioPlayer()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try!AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "music",ofType: ".mp3")!) as URL)
        audio.prepareToPlay()
        addThumbImgForSlider()
    }
    func addThumbImgForSlider(){
        sld_volume.setThumbImage(UIImage(named: "thumb.png"), for: .normal)
        sld_volume.setThumbImage(UIImage(named: "thumbHightLight.png"), for: .normal)
    }

    @IBAction func acc_Play(_ sender: Any) {
        if (count == 0){
            audio.play()
            btn_Play.setImage(UIImage(named: "pause"), for: .normal)
            count = 1
        }else if (count == 1){
            audio.stop()
            btn_Play.setImage(UIImage(named: "play"), for: .normal)
            count = 0
        }
        
    }
    @IBAction func sld_volume(_ sender: UISlider) {
        audio.volume = sender.value
    }


}

