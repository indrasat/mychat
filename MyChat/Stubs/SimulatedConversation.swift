//
//  SimulatedConversation.swift
//  MyChat
//
//  Created by Indra Kurniawan on 17/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class SimulatedConversation {
    enum State {
        case webSocket
        case inApp
        case appClosed
    }

    let contact: String
    var lastReceivedMessage = Date()
    var state: State = .webSocket
    init(with contact: String) {
        self.contact = contact
    }

    func receivedMessage() {
        lastReceivedMessage = Date()
    }

    func enteredChatViewController() {
        print("🤖: Will send the messages from \(contact) through the web socket again now")
        state = .webSocket
    }

    func leftChatViewController() {
        print("🤖: Will send the messages from \(contact) through push now")
        state = .inApp
    }

    func leftApp() {
        print("🤖: Detected that the app closed. \(contact) might send you a goodbye through push")
        state = .appClosed
    }
}
