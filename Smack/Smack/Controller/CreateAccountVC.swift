//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Zensar on 07/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    //MARKS: OUTLETS
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARKS: Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARKS: Action
    @IBAction func closedPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        guard let name = usernameTxt.text, usernameTxt.text != nil else { return }
        guard let email = emailTxt.text , emailTxt.text != nil else { return }
        guard let password = passwordTxt.text, passwordTxt.text != nil  else { return }
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: {
                    (success) in
                        if success {
                            AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor:  self.avatarColor, completion: {
                                (success) in
                                    if success {
                                        self.spinner.stopAnimating()
                                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGED, object: nil)
                                    
                            }
                        })
                    }
                })
            } else {
                print ("Failed to create new user!!")
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        avatarColor = "[\(r), \(g), \(b), 1]"
        bgColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImage.backgroundColor = self.bgColor
        }
        
    }
    
    func setUpView() {
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [
            NSAttributedStringKey.foregroundColor: smackPurplePlaceholder
            ])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [
            NSAttributedStringKey.foregroundColor: smackPurplePlaceholder
            ])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [
            NSAttributedStringKey.foregroundColor: smackPurplePlaceholder
            ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap () {
        view.endEditing(true)
    }
    
    
    
}
