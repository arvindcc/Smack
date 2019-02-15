//
//  MessagesService.swift
//  Smack
//
//  Created by Zensar on 11/08/18.
//  Copyright © 2018 Zensar. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MessageService {
    static let instance = MessageService()
    var channels = [Channel]()
    var selectedChannel : Channel?
    var messages = [Message]()
    
    
    func findAllChanel(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            let description = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, ChannelDescription: description, id: id)
                            self.channels.append(channel)
                            NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                            completion(true)
                        }
                    }else {
                        print("Cannot Convert the Response to Json")
                    }
                } catch let error {
                    print(error as Any)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllMessagesForChannel(channelId: String, completion : @escaping CompletionHandler){
        Alamofire.request("\(URL_GET_MESSAGES)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { ( response ) in
            if response.result.error == nil{
                self.clearAllMessages()
                guard let data = response.data else {return}
                do {
                    if let json = try JSON(data: data).array {
                        for item in json {
                            
                            let id = item["_id"].stringValue
                            let messageBody = item["messageBody"].stringValue
                            let channelId = item["channelId"].stringValue
                            let userName = item["userName"].stringValue
                            let userAvatar = item["userAvatar"].stringValue
                            let userAvatarColor = item["userAvatarColor"].stringValue
                            let timeStamp = item["timeStamp"].stringValue
                            
                            let message = Message(message: messageBody, userName: userName, channelId: channelId, userAvatar: userAvatar,userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                            self.messages.append(message)
                            NotificationCenter.default.post(name: NOTIF_CHANNELS_LOADED, object: nil)
                        }
                    }else {
                        print("Cannot Convert the Response to Json")
                    }
                    
                    completion(true)
                } catch let error {
                    print(error as Any)
                }
            } else {
                print("API get Message dont work")
                debugPrint(response.result.error as Any)
                completion(true)
            }
        }
    }
    
    
    func clearAllChannels() {
        channels.removeAll()
    }
    
    func clearAllMessages() {
        messages.removeAll()
    }
    
}
