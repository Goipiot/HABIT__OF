//
//  HabitDay.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 06/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

public struct HabitDay: Decodable {
    
    public var date: String
    public var status: String
    public var isChanged: Bool
    
}
