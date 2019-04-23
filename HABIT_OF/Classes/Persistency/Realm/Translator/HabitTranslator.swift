//
//  HabitTranslator.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import RealmSwift

open class HabitTranslator {
    
    func translate(rlmHabits: Results<RMHabit>) -> [Habit] {
        let rlmArray = Array(rlmHabits)
        let habits = rlmArray.map { (rlmHabit) -> Habit in
            let habit = Habit(title: rlmHabit.title,
                              comment: rlmHabit.comment,
                              alertTime: rlmHabit.alertTime,
                              creationTime: rlmHabit.creationTime,
                              doNotify: rlmHabit.doNotify,
                              autoStatus: rlmHabit.autoStatus,
                              days: self.translate(rlmDays: rlmHabit.days),
                              activeDays: Array(rlmHabit.activeDays))
            return habit
        }
        return habits
    }
    
    func translate(rlmDays: List<RMHabitDay>) -> [HabitDay] {
        let rlmArray = Array(rlmDays)
        let days = rlmArray.map { (rlmDay) -> HabitDay in
            let day = HabitDay(date: rlmDay.date,
                               status: rlmDay.status,
                               isChanged: rlmDay.isChanged)
            return day
        }
        return days
    }
    
    func translate(rlmDays: Results<RMHabitDay>) -> [HabitDay] {
        let rlmArray = Array(rlmDays)
        let days = rlmArray.map { (rlmDay) -> HabitDay in
            let day = HabitDay(date: rlmDay.date,
                               status: rlmDay.status,
                               isChanged: rlmDay.isChanged)
            return day
        }
        return days
    }
    
}
