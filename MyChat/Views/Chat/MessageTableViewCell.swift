//
//  MessageTableViewCell.swift
//  MyChat
//
//  Created by Indra Kurniawan on 15/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell, IdentifiableCell {

    private lazy var bubble: MessageBubble = {
        let bubble = MessageBubble()
        contentView.addSubview(bubble)
        return bubble
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    func configure(with message: MessageViewModel) {
        bubble.configure(with: message)
    }

    private func setup() {
        addConstraints()
    }

    private func addConstraints() {
        bubble.attach(to: self)
    }

}
