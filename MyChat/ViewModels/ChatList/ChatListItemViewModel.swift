//
//  ChatListItemViewModel.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

struct ChatListItemViewModel {
    let contact: String
    let message: String
    let lastMessageDate: String
    let unreadMessageCount: Int
    let itemTapped: () -> Void
}
