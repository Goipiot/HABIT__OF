//
//  HabitViewModel.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 11/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

struct HabitViewModel {
    
    var title: String
    var doNotify: Bool
    var alertTime: String
    var comment: String
    var creationTime: String
    var autoStatus: String
    var days: [HabitDayViewModel]
    
    init(habit: Habit) {
        title = habit.title
        doNotify = habit.doNotify
        alertTime = habit.alertTime
        comment = habit.comment
        creationTime = habit.creationTime
        autoStatus = habit.autoStatus
        let visibleDays = HabitPointManager.getHabitPointsForVisibleDates(for: habit)
        let habitDays = visibleDays.map { (habitDay) -> HabitDayViewModel in
            let habitDayVM = HabitDayViewModel(habitDay: habitDay)
            return habitDayVM
        }
        days = habitDays
    }
}
