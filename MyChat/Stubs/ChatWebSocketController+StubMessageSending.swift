//
//  ChatWebSocketController+StubMessageSending.swift
//  MyChat
//
//  Created by Indra Kurniawan on 17/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

extension ChatWebSocket: StubMessageSending {
    class func send(stub message: Message, after timeInterval: TimeInterval = 0) {
        guard case .other(let contact) = message.sender else {
            return
        }

        MessageEventRouter.route(event: .received(message: message, contact: contact))
    }
}

extension ChatWebSocket: StubMessageReading {
    static func read(stub message: Message, reader: String) {
        MessageEventRouter.route(event: .otherRead(yourMessage: message, reader: reader))
    }
}
