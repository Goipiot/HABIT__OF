//
//  RMHabitTranslator.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import RealmSwift

open class RMHabitTranslator {
    
    func translate(habits: [Habit]) -> List<RMHabit> {
        let rlmEntities = List<RMHabit>()
        for habit in habits {
            let rlmEntity = RMHabit()
            rlmEntity.alertTime = habit.alertTime
            rlmEntity.autoStatus = habit.autoStatus
            rlmEntity.comment = habit.comment
            rlmEntity.creationTime = habit.creationTime
            rlmEntity.doNotify = habit.doNotify
            rlmEntity.title = habit.title
            rlmEntity.days = translate(habitDays: habit.days)
            rlmEntity.activeDays = translate(activeDates: habit.activeDays)
            rlmEntities.append(rlmEntity)
        }
        return rlmEntities
    }
    
    func translate(habitDays: [HabitDay]) -> List<RMHabitDay> {
        let rlmEntity = List<RMHabitDay>()
        
        for day in habitDays {
            let rlmDay = RMHabitDay()
            rlmDay.date = day.date
            rlmDay.status = day.status
            rlmDay.isChanged = day.isChanged
            rlmEntity.append(rlmDay)
        }
        return rlmEntity
    }
    
    func translate(activeDates: [String]) -> List<String> {
        let rlmEntity = List<String>()
        
        for day in activeDates {
            rlmEntity.append(day)
        }
        return rlmEntity
    }

}
