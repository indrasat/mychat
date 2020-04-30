//
//  ChatEventRouter.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class ChatEventRouter {
    static func route(event: ChatEvent) {
        switch event {
        case .applicationInitialized:
            ChatEventHandler.started()
        case .loaded(let chats):
            ChatEventHandler.loaded(chats: chats)
        case .creatingChat(let contact):
            let chat = ChatModel.create(chatWith: contact)
            ChatEndpoint.create(chat: chat)
            ChatEventHandler.creatingChat()
        case .created(let chat):
            ChatEventHandler.created(chat: chat)
        case .createChatFailed(let reason):
            ChatEventHandler.failedCreatingChat(reason: reason)
        }
    }
}
