//
//  DateParser.swift
//  MyChat
//
//  Created by Indra Kurniawan on 18/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class DateParser {
    private static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter
    }()

    class func date(from string: String) -> Date? {
        return formatter.date(from: string)
    }
}
