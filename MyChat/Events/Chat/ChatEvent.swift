//
//  ChatEvent.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

enum ChatEvent {
    case applicationInitialized
    case loaded(chats: [Chat])
    case creatingChat(contact: String)
    case created(chat: Chat)
    case createChatFailed(reason: String)
}
