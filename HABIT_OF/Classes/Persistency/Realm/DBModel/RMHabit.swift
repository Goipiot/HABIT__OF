//
//  RMHabit.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import RealmSwift

@objcMembers public class RMHabit: Object {
    
    // MARK: - Properties
    
    dynamic var title: String = ""
    dynamic var comment: String = ""
    dynamic var alertTime: String = "10:00"
    dynamic var creationTime: String = ""
    dynamic var doNotify: Bool = true
    dynamic var autoStatus: String = "Skip"
    dynamic var activeDays = List<String>()
    var days = List<RMHabitDay>()
    
    // MARK: - PrimaryKey
    
    override public static func primaryKey() -> String? {
        return "title"
    }

}
