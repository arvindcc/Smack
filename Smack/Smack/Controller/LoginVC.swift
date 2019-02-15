//
//  LoginVC.swift
//  Smack
//
//  Created by Zensar on 07/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let email = usernameTxt.text , usernameTxt.text != nil else { return }
        guard let password = passwordTxt.text, passwordTxt.text != nil  else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGED, object: nil)
                    self.dismiss(animated: true, completion: nil)
                    self.spinner.stopAnimating()
                })
                
            } else{
                print("Sorry Cant login")
            }
        }
        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCreateAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
