//
//  User.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

public struct User: Decodable {
    
    public var login: String
    public var password: String
    public var email: String
    public var isPassProtected: Bool
    public var firstDayOfWeek: String
    public var habits: [Habit]
    
}
