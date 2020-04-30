//
//  CreateChatViewModel.swift
//  MyChat
//
//  Created by Indra Kurniawan on 21/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

struct CreateChatViewModel {
    let hideError: Bool
    let enableCreate: Bool
    let showSpinner: Bool
    let error: String
    let create: (String) -> Void
}
