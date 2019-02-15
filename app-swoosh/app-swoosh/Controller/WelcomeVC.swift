//
//  ViewController.swift
//  app-swoosh
//
//  Created by Zensar on 03/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var swoosh: UIImageView!
    @IBOutlet weak var bgImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindFromSkillvc(unwindSegue: UIStoryboardSegue) {
        
    }


}

