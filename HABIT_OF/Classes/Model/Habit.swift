//
//  Habit.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

public struct Habit: Decodable {
    
    public var title: String
    public var comment: String
    public var alertTime: String
    public var creationTime: String
    public var doNotify: Bool
    public var autoStatus: String
    public var days: [HabitDay]
    public var activeDays: [String]
    
}
