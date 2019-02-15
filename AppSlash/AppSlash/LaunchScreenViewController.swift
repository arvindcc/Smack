//
//  LaunchScreenViewController.swift
//  AppSlash
//
//  Created by Arvind Chawdhary on 30/10/18.
//  Copyright © 2018 private. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    @IBOutlet weak var appLogoImage: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var errorMsg: UILabel!
    
    @IBOutlet weak var reloadBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkInternetConnection()
    }
    
    @objc func loadWebView() {
        self.performSegue(withIdentifier: "loadWebView", sender: nil)
    }

    func checkInternetConnection() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        spinner.startAnimating()
        if Reachability().isConnectedToNetwork() == true{
            errorMsg.isHidden = true
            reloadBtn.isHidden = true
            UIView.animate(withDuration: 0.5, delay: 0.4, options: [.repeat, .autoreverse], animations: {
                self.appLogoImage.transform = self.appLogoImage.transform.rotated(by: CGFloat(Double.pi))
            }, completion: nil)
            self.perform(#selector(self.loadWebView), with: nil, afterDelay: 5.0)
        }else{
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            spinner.stopAnimating()
            spinner.isHidden = true
            errorMsg.isHidden = false
            reloadBtn.isHidden = false
            errorMsg.text = "Internet connection unavailable."
        }
    }
    
    @IBAction func onReloadBtnPressed(_ sender: Any) {
        checkInternetConnection()
    }
    
}
