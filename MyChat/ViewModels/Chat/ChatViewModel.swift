//
//  ChatViewModel.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

struct ChatViewModel {
    let shouldAnimateChanges: Bool
    let shouldWipeMessage: Bool
    let shouldBeBusy: Bool
    let shouldShowEmpty: Bool
    let shouldShowError: Bool
    let error: String?
    let contact: String
    let messages: [MessageViewModel]
    let tableViewDifferences: TableViewDataDifferences
    let send: (_ message: String) -> Void
    let afterShowingMessages: () -> Void
}
