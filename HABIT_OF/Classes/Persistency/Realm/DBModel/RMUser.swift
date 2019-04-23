//
//  RMUser.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import RealmSwift

@objcMembers public class RMUser: Object {
    
    // MARK: - Properties
    
    dynamic var login: String = ""
    dynamic var password: String = ""
    dynamic var email: String = ""
    dynamic var isPassProtected: Bool = true
    dynamic var firstDayOfWeek: String = "Monday"
    var habits = List<RMHabit>()
    
    // MARK: - PrimaryKey
    
    override public static func primaryKey() -> String? {
        return "login"
    }
    
}
