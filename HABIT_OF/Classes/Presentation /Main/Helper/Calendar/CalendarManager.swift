//
//  CalendarManager.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 09/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

struct CalendarManager {
    
    // MARK: - Public properties
    
    static let dates = Date.getDates(forLastNDays: 70)
    static var visibleDates = selectedDate.getDates(forLastNDays: 7)
    static var selectedDate = Date() {
        didSet {
            visibleDates = selectedDate.getDates(forLastNDays: 7)
            NotificationCenter.default.post(name: .userPickedNewDate, object: nil)
            NotificationCenter.default.post(name: .selectedCurrentDate, object: nil)
            
        }
    }
    
    static func isTodaySelected() -> Bool {
        return Calendar.saved.isDateInToday(selectedDate)
    }
}
