//
//  chatModel.swift
//  simpleChatApp
//
//  Created by ibaikaa on 26/10/22.
//


import UIKit

class Chat{
    let chatTitle: String
    let latestMessage: String
    let avatar: UIImage
    
    init(chatTitle: String, latestMessage: String, avatar: UIImage) {
        self.chatTitle = chatTitle
        self.latestMessage = latestMessage
        self.avatar = avatar
    }
}
