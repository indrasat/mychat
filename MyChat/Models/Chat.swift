//
//  Chat.swift
//  MyChat
//
//  Created by Indra Kurniawan on 13/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class Chat {
    let contact: String
    var messages: [Message]
    var unreadMessages: Int {
        return messages.filter {
            switch ($0.sender, $0.state) {
            case (.user, _), (.other, .read): return false
            case (.other, .sending), (.other, .sent): return true
            }
        }.count
    }
    var lastMessage: Date? {
        return messages.last?.sendDate
    }

    init(with contact: String, messages: [Message] = []) {
        self.contact = contact
        self.messages = messages
    }
}
