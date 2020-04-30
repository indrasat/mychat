//
//  RequestHandler.swift
//  LiveCore
//
//  Created by Indra Kurniawan on 5/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

enum Result<T: Decodable> {
    case success(result: T)
    case failure(error: String)
}

enum SingleResult<T: Decodable> {
    case success(result: T)
    case failure(error: String)
}
