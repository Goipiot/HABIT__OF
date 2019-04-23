//
//  WeekdaysManager.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 24/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

class WeekdaysManager {
    
    static let weekDays = DateManager.getWeekdaysLabels()
    static var selectedDates = [String]()
    
    static func removeWeekayFromSelection(weekday: String) {
        selectedDates.removeAll(where: { $0 == weekday })
    }
}
