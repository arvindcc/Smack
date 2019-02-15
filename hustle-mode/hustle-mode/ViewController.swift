//
//  ViewController.swift
//  hustle-mode
//
//  Created by Zensar on 03/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlackBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func powerButtonPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlackBG.isHidden = true
        powerBtn.isHidden = true
         player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 250, width: 375, height: 141 )
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
        
    }
    
}

