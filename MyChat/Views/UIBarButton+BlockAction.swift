//
//  UIBarButton+BlockAction.swift
//  MyChat
//
//  Created by Indra Kurniawan on 20/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

typealias BlockBarButtonActionBlock = (_ sender: UIBarButtonItem) -> Void
private class BarButtonActionBlockWrapper: NSObject {
    var block: BlockBarButtonActionBlock
    init(block: @escaping BlockBarButtonActionBlock) {
        self.block = block
    }
}

extension UIBarButtonItem {
    public func action(block: @escaping (UIBarButtonItem) -> Void) {
        objc_setAssociatedObject(self,
                                 &actionBlockKey,
                                 BarButtonActionBlockWrapper(block: block),
                                 objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        self.action = #selector(block_handleAction(sender:))
        self.target = self
    }

    @objc
    fileprivate func block_handleAction(sender: UIBarButtonItem) {
        guard let wrapper = objc_getAssociatedObject(self, &actionBlockKey) as? BarButtonActionBlockWrapper else {
            return assertionFailure("Got an action I couldn't find a block for")
        }
        wrapper.block(sender)
    }
}
