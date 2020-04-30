//
//  ChatListItemViewModelBuilder.swift
//  MyChat
//
//  Created by Indra Kurniawan on 18/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class ChatListItemViewModelBuilder {

    class func build(for chat: Chat) -> ChatListItemViewModel {
        let lastMessageText = chat.messages.last?.message ?? ""
        let lastMessageDate = (chat.messages.last?.sendDate).map { DateRenderer.string(from: $0) } ?? ""
        let unreadMessageCount = ChatModel.unreadMessages(for: chat.contact).count

        return ChatListItemViewModel(contact: chat.contact,
                                     message: lastMessageText,
                                     lastMessageDate: lastMessageDate,
                                     unreadMessageCount: unreadMessageCount,
                                     itemTapped: { show(chat: chat) })
    }

    private class func show(chat: Chat) {
        let chatViewController = ChatViewController(for: chat)
        BaseNavigationViewController.pushViewController(chatViewController, animated: true)
    }
}
