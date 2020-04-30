//
//  ActionButton.swift
//  MyChat
//
//  Created by Indra Kurniawan on 15/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class ActionButton: UIButton {

    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.white : tintColor
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.black, for: .highlighted)
        backgroundColor = tintColor
        layer.cornerRadius = 4
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.masksToBounds = false
        setContentCompressionResistancePriority(.required, for: .horizontal)
        let insets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 18)
        contentEdgeInsets = insets
    }

}
