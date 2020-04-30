//
//  CreateChatViewController.swift
//  MyChat
//
//  Created by Indra Kurniawan on 14/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class CreateChatViewController: UIViewController {

    private lazy var customView: CreateChatView = {
        let customView = CreateChatView()
        return customView
    }()

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Create Chat"

        //customView.display(viewModel: CreateChatViewModelBuilder.build(isSending: false, error: nil))
        ChatEventHandler.add(listener: self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }

}

extension CreateChatViewController: CreateChatListening {
    func updated(create: CreateChatViewModel) {
        customView.display(viewModel: create)
    }
}
