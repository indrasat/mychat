//
//  ChatListViewModel.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

struct ChatListViewModel {
    let hideEmptyMessage: Bool
    let hideChats: Bool
    let showSpinner: Bool
    let chats: [ChatListItemViewModel]
    let addChat: () -> Void
}
