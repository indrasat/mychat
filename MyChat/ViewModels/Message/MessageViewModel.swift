//
//  MessageViewModel.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

struct MessageViewModel {
    enum Sender {
        case user
        case other
    }

    enum Status: String {
        case unread = ""
        case read = "✓"
    }

    let sentBy: Sender
    let message: String
    let sendStatus: String
    let readStatus: Status
}
