//
//  UserProfileVC.swift
//  Smack
//
//  Created by Zensar on 10/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImg: CircleImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func setUpView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeOnTouch = UITapGestureRecognizer(target: self, action: #selector(UserProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeOnTouch)
        
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onClosedPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onLogoutPressed(_ sender: Any) {
        UserDataService.instance.loggoutUser()
        dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGED, object: nil)
    }
    
}
