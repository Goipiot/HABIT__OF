//
//  HabitDayViewModel.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 11/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

struct HabitDayViewModel {
    
    var color: UIColor
    var date: String
    
    init(habitDay: HabitDay) {
        switch habitDay.status {
        case "Clean":
            color = UIColor.white
        case "Done":
            color = UIColor.customGreen
        case "Failed":
            color = UIColor.red
        case "Skip":
            color = UIColor.customPink
        default:
            color = UIColor.white
        }
        
        date = habitDay.date
    }
    
}
