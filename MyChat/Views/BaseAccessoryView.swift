//
//  BaseAccessoryView.swift
//  MyChat
//
//  Created by Indra Kurniawan on 14/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class BaseAccessoryView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        autoresizingMask = .flexibleHeight
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: bounds.width, height: 46)
    }

}
