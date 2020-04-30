//
//  ChatWebSocket.swift
//  MyChat
//
//  Created by Indra Kurniawan on 17/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

enum ChatWebSocketMessage {
    case new(message: Message)
    case read(message: Message)
}

class ChatWebSocket {
    static var currentlyConnectedContacts: [String] = []

    class func start(for contact: String) {
        currentlyConnectedContacts.append(contact)
    }

    class func disconnect(for contact: String) {
        currentlyConnectedContacts = currentlyConnectedContacts.filter { $0 == contact }
    }
}
