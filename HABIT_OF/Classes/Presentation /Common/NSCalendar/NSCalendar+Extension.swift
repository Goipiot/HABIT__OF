//
//  NSCalendar+Extension.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 15/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import Foundation

extension Calendar {
    
    static var saved: Calendar {
        var cal = NSCalendar.current
        cal.timeZone = TimeZone(identifier: "GMT+0")!
        cal.locale = NSLocale.current
        return cal
    }
}
