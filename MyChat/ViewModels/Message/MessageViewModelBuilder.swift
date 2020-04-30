//
//  MessageViewModelBuilder.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

fileprivate extension Message.State {
    func sendStatus(with sendDate: Date) -> String {
        switch self {
        case .read, .sent: return DateRenderer.string(from: sendDate)
        case .sending: return "Sending..."
        }
    }

    func readStatus() -> MessageViewModel.Status {
        switch self {
        case .read: return .read
        case .sending, .sent: return .unread
        }
    }
}

fileprivate extension Message.Sender {
    func sender() -> MessageViewModel.Sender {
        switch self {
        case .other: return .other
        case .user: return .user
        }
    }
}

class MessageViewModelBuilder: NSObject {
    static func build(for message: Message) -> MessageViewModel {
        return MessageViewModel(sentBy: message.sender.sender(),
                                message: message.message,
                                sendStatus: message.state.sendStatus(with: message.sendDate),
                                readStatus: message.state.readStatus())
    }
}
