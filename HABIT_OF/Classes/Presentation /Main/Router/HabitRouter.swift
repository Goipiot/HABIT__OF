//
//  HabitRouter.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class HabitRouter: Router {
    
    var presenter: UIViewController?
    
    init(presenter: UIViewController) {
        self.presenter = presenter
    }
}
