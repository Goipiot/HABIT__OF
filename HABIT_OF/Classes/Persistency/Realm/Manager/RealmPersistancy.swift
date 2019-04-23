//
//  RealmPersistancy.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import RealmSwift

open class RealmPersistancy: PersistancyProtocol {
    
    // MARK: - Initialization
    
    public init() {
    }
    
    // MARK: - PersistancyProtocol
    
    public func loadAllHabits() -> [Habit] {
        let realm = try? Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        let events = realm!.objects(RMHabit.self)
            .sorted(byKeyPath: "creationTime")
        return HabitTranslator().translate(rlmHabits: events)
    }
    
    public func saveHabits(habits: [Habit]) {
        let realm = try? Realm()
        let rlmModel = RMHabitTranslator().translate(habits: habits)
        try? realm?.write {
            realm?.add(rlmModel, update: true)
        }
    }
    
    public func saveHabitDay(habitDay: HabitDay) {
        let realm = try? Realm()
        let rlmModel = RMHabitTranslator().translate(habitDays: [habitDay])
        try? realm?.write {
            realm?.add(rlmModel, update: true)
        }
    }
    
    public func updateHabitDay(for date: String, with status: String) {
        let realm = try? Realm()
        let events = realm!.objects(RMHabitDay.self)
            .filter("date == %@", date)
            .first!
        try? realm?.write {
            events.status = status
            events.isChanged = true
        }
    }
}
