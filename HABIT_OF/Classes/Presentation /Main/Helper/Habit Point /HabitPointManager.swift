//
//  HabitPointManager.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 16/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

struct HabitPointManager {
    
    // Public Properties
    
    static var selectedPointIndex: Int?
    
    // Public Methods
    
    static func getSelectedPointDate() -> String? {
        guard let index = selectedPointIndex else {
            return nil
        }
        let date = CalendarManager.visibleDates[index + 1]
        return DateFormatter.get(with: .full).string(from: date)
    }
    
    static func generateHabitPoints(with activeDays: [String], creationDate: String) -> [HabitDay] {
        var habitDays = [HabitDay]()
        let avaliableDates = DateManager.getDates(with: activeDays, from: creationDate)
        for avaliableDate in avaliableDates {
            let newHabitDay = HabitDay(date: avaliableDate,
                                       status: HabitPointStatus.clean.rawValue,
                                       isChanged: false)
            habitDays.append(newHabitDay)
        }
        return habitDays
    }
    
    static func getHabitPointsForVisibleDates(for habit: Habit) -> [HabitDay] {
        var visibleHabitPoints = [HabitDay]()
        let cal = Calendar.current
        for day in habit.days {
            let date = DateFormatter.get(with: .full).date(from: day.date)!
            for visibleDate in CalendarManager.visibleDates
                where cal.isDate(date, inSameDayAs: visibleDate) {
                    visibleHabitPoints.append(day)
            }
        }
        return visibleHabitPoints
    }
}
