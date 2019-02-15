//
//  ViewController.swift
//  AppSlash
//
//  Created by Arvind Chawdhary on 30/10/18.
//  Copyright © 2018 private. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet var webView: WKWebView!
    let webPageSpinner = UIActivityIndicatorView()
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.onBackPressed(_:)))
        self.navigationItem.leftBarButtonItem = newBackButton;
        let url = URL(string:"http://www.appslash.org")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*
         To init Spinner
         initSpinner()
         */
    }

    @IBAction func onBackPressed(_ sender: Any) {
        if(webView.canGoBack) {
            webView.goBack()
        }
    }
    
    // this handles target=_blank links by opening them in the same view
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if Reachability().isConnectedToNetwork() == true{
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }else{
            performSegue(withIdentifier: "loadLaunchScreen", sender: nil)
        }
        
        return nil
    }
    
    func initSpinner() {
        webPageSpinner.style = .whiteLarge
        webPageSpinner.color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        webPageSpinner.frame = CGRect(x: self.view.center.x, y: self.view.center.y, width: 48, height: 48)
        view.addSubview(webPageSpinner)
        view.bringSubviewToFront(webPageSpinner)
        webPageSpinner.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webPageSpinner.stopAnimating()
        webPageSpinner.isHidden = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        webPageSpinner.stopAnimating()
        webPageSpinner.isHidden = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        webPageSpinner.isHidden = false
        webPageSpinner.startAnimating()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
}

