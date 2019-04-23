//
//  CalendarViewModel.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

struct CalendarViewModel {
    
    var dateLabel: String
    var habitProportion: [Int] = [1, 2, 3, 4]
    
    init(date: Date) {
        dateLabel = DateFormatter.get(with: .week).string(from: date)
    }
}
