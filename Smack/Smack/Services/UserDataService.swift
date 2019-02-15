//
//  UserDataService.swift
//  Smack
//
//  Created by Zensar on 08/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation

class UserDataService{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarName = ""
    public private(set) var avatarColor = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarName = avatarName
        self.avatarColor = avatarColor
        self.email = email
        self.name = name
        
        
    }
    
    func loggoutUser() {
        id = ""
        name = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.authToken = ""
        AuthService.instance.userEmail = ""
        MessageService.instance.clearAllChannels()
        MessageService.instance.clearAllMessages()
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName    
    }
    
    func returnUIColor (components: String) -> UIColor{
        var r, g, b, a : NSString?
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
            let defaultColor = UIColor.lightGray
        
        guard let rUnrapped = r else {return defaultColor}
        guard let gUnrapped = g else {return defaultColor}
        guard let bUnrapped = b else {return defaultColor}
        guard let aUnrapped = a else {return defaultColor}
        
        let rfloat = CGFloat(rUnrapped.doubleValue)
        let gfloat = CGFloat(gUnrapped.doubleValue)
        let bfloat = CGFloat(bUnrapped.doubleValue)
        let afloat = CGFloat(aUnrapped.doubleValue)
        
        let newColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        return newColor
    }
}
