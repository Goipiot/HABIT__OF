//
//  RMHabitDay.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import RealmSwift

@objcMembers public class RMHabitDay: Object {
    
    // MARK: - Properties
    
    dynamic var date: String = ""
    dynamic var status: String = ""
    dynamic var isChanged: Bool = false
    
    // MARK: - PrimaryKey
    
    override public static func primaryKey() -> String? {
        return "date"
    }
    
}
