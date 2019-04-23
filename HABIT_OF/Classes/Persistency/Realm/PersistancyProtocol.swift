//
//  PersistancyProtocol.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

public protocol PersistancyProtocol {
    func loadAllHabits() -> [Habit]
    func saveHabits(habits: [Habit])
}
