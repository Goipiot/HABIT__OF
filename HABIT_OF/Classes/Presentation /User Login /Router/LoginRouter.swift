//
//  LoginRouter.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class LoginRouter: Router {
    
    var presenter: UIViewController?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    init(presenter: UIViewController) {
        self.presenter = presenter
    }

}
