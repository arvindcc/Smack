//
//  AddChannelVC.swift
//  Smack
//
//  Created by Zensar on 11/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    //MARKS: Outlet
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var channelDescription: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let closeOnTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.onTap(_:)))
        bgView.addGestureRecognizer(closeOnTouch)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARKS: - Actions
    
    @objc func onTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onClosedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateChannelPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelName = userName.text, userName.text != "" else {return}
            guard let channeldescription = channelDescription.text, channelDescription.text != "" else {return}
            SocketService.instance.addChannel(channelName: channelName, channeldescription: channeldescription) { (success) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    

    
    
    
    
    
    
    

}
