//
//  ChatsViewController.swift
//  MyChat
//
//  Created by Indra Kurniawan on 11/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    private lazy var customView: ChatsView = {
        let customView = ChatsView()
        return customView
    }()

    private var addButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ChatEventHandler.add(listener: self)
        ChatEventRouter.route(event: .applicationInitialized)
        title = "Chats"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = addButton
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.rightBarButtonItem = nil
    }
}

extension ChatsViewController: ChatListListening {
    func updated(list: ChatListViewModel) {
        addButton.action(block: { _ in
            list.addChat()
        })
        customView.display(viewModel: list)
    }
}
