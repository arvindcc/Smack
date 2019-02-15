//
//  Constants.swift
//  Smack
//
//  Created by Zensar on 07/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation

//MARKS: Url Constants

let BASE_URL = "https://chattychatchat.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_FIND_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNEL = "\(BASE_URL)channel"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"


typealias CompletionHandler = (_ Success: Bool) -> ()

//MARKS: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//MARKS: Color
let smackPurplePlaceholder = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 0.5)

//MArks: Notification
let NOTIF_USER_DATA_DID_CHANGED = Notification.Name("notifyUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")


//MARKS: USER DEFAULTS
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


//MARKS: Header

let HEADER =   [
    "Content-Type" : "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type" : "application/json; charset=utf-8"
]
