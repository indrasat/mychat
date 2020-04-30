//
//  DateRenderer.swift
//  MyChat
//
//  Created by Indra Kurniawan on 16/02/2020.
//  Copyright © 2020 Indra Kurniawan. All rights reserved.
//

import UIKit

class DateRenderer {
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter
    }

    class func string(from date: Date) -> String {
        return dateFormatter.string(from: date)
    }
}
