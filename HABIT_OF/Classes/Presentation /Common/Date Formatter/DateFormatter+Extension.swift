//
//  DateFormatter+Extension.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

enum DateFormat {
    case day
    case week
    case weekNavBar
    case weekDay
    case full
}

extension DateFormatter {
    
    static func get(with format: DateFormat) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.calendar = Calendar.current
        switch format {
        case .day:
            formatter.dateFormat =  "dd"
        case .week:
            formatter.dateFormat =  "EE, d"
        case .weekNavBar:
            formatter.dateFormat =  "EEEE, d"
        case .weekDay:
            formatter.dateFormat =  "EE"
        case .full:
            formatter.dateFormat =  "YYYY-MM-dd"
        }
        return formatter
    }
}
