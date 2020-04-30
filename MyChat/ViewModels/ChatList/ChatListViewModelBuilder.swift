//
//  ChatListViewModelBuilder.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class ChatListViewModelBuilder {
    class func buildLoading() -> ChatListViewModel {
        return ChatListViewModel(hideEmptyMessage: false,
                                 hideChats: true,
                                 showSpinner: true,
                                 chats: [],
                                 addChat: addChat)
    }

    class func build(for chats: [Chat]) -> ChatListViewModel {
        let chatListItemViewModels = chats.map(ChatListItemViewModelBuilder.build)
        return ChatListViewModel(hideEmptyMessage: !chats.isEmpty,
                                 hideChats: chats.isEmpty,
                                 showSpinner: false,
                                 chats: chatListItemViewModels,
                                 addChat: addChat)
    }

    private class func addChat() {
        let createChatViewController = CreateChatViewController()
        BaseNavigationViewController.pushViewController(createChatViewController, animated: true)
    }
}
