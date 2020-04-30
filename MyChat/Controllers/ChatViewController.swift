//
//  ChatViewController.swift
//  MyChat
//
//  Created by Indra Kurniawan on 11/02/2020.
//  Copyright © 2018 Departamento B. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    private lazy var customView: ChatView = {
        let customView = ChatView(frame: CGRect(x: 0, y: 64, width: 320, height: 500))
        return customView
    }()

    let chat: Chat

    init(for chat: Chat) {
        self.chat = chat
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a new stub message sending object
        ConversationSimulator.createdConversation(with: chat.contact)

        title = chat.contact
        ChatWebSocket.start(for: chat.contact)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        MessageEventHandler.add(listener: self)

        // Start receiving fake responses through the websocket again
        ConversationSimulator.enteredChatViewController(ofConversationWith: chat.contact)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        ChatWebSocket.disconnect(for: chat.contact)
        MessageEventHandler.remove(listener: self)
        // Stop receiving fake responses through the websocket
        ConversationSimulator.leftChatViewController(ofConversationWith: chat.contact)
    }
}

extension ChatViewController: ChatListening {
    func handles(chatWith contact: String) -> Bool {
        return contact == chat.contact
    }

    func updated(chat: ChatViewModel) {
        title = chat.contact
        customView.display(viewModel: chat)
    }
}
