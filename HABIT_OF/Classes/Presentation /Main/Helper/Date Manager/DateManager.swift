//
//  DateManager.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 16/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

struct DateManager {
    
    static func getDates(with weekdays: [String], from date: String) -> [String] {
        var activeDates = [String]()
        let creationDate = DateFormatter.get(with: .full).date(from: date)!
        let datesArray = Date.dates(from: creationDate, to: CalendarManager.dates.last!)
        for date in datesArray {
            let dateWeekday = DateFormatter.get(with: .weekDay).string(from: date)
            for activeDay in weekdays where dateWeekday == activeDay {
                let dateString = DateFormatter.get(with: .full).string(from: date)
                activeDates.append(dateString)
            }
        }
        return activeDates
    }
    
    static func getWeekdaysLabels() -> [String] {
        let weekDates = CalendarManager.visibleDates
        var weekDaysStringArray = [String]()
        for date in weekDates {
            let weekdayString = DateFormatter.get(with: .weekDay).string(from: date)
            weekDaysStringArray.append(weekdayString)
        }
        return weekDaysStringArray
    }
}
