//
//  ChannelVC.swift
//  Smack
//
//  Created by Zensar on 07/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARKS: OUTLET
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChanged(_: )), name: NOTIF_USER_DATA_DID_CHANGED, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(channelsLoaded(_:)), name: NOTIF_CHANNELS_LOADED, object: nil)
        
        SocketService.instance.getChannel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARKS: ACTION
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        
        if AuthService.instance.isLoggedIn {
            let profile = UserProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }

    
    @objc func userDataDidChanged (_ notify: Notification){
        setupUserData()
    }
    
    @objc func channelsLoaded (_ notify: Notification) {
        tableView.reloadData()
    }
    
    func setupUserData(){
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        }else{
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "profileDefault")
            userImage.backgroundColor = UIColor.lightGray
            tableView.reloadData()
        }
    }
    @IBAction func onAddChannelPressed(_ sender: Any) {
        let addchannel = AddChannelVC()
        addchannel.modalPresentationStyle = .custom
        present(addchannel, animated: true, completion: nil)
    }
    
    //MARKS: TableView Actions
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell{
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else{
            return UITableViewCell()
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = MessageService.instance.channels[indexPath.row]
        MessageService.instance.selectedChannel = channel
        NotificationCenter.default.post(name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        self.revealViewController().revealToggle(animated: true)
    }
    
}

