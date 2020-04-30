//
//  MessageEvent.swift
//  MyChat
//
//  Created by Indra Kurniawan on 17/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

enum MessageEvent {
    case sending(message: Message, contact: String, previousMessages: [Message])
    case sent(message: Message, contact: String)
    case failedSending(message: Message, contact: String, reason: String)
    case received(message: Message, contact: String)
    case userRead(messagesSentBy: String)
    case otherRead(yourMessage: Message, reader: String)
}
