//
//  CreateChatViewModelBuilder.swift
//  MyChat
//
//  Created by Indra Kurniawan on 21/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class CreateChatViewModelBuilder {
    static func build(isSending: Bool, error: String?) -> CreateChatViewModel {
        let create = isSending ? { _ in } : self.create
        return CreateChatViewModel(hideError: error == nil,
                                   enableCreate: !isSending,
                                   showSpinner: isSending,
                                   error: error ?? "",
                                   create: create)
    }

    private static func create(with contact: String) {
        guard contact != "" else {
            ChatEventRouter.route(event: .createChatFailed(reason: "Please provide a contact name"))
            return
        }

        ChatEventRouter.route(event: .creatingChat(contact: contact))
    }
}
