//
//  UserSignupViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class UserSignupViewController: UIViewController {

    // MARK: - Private Properties
    
    private lazy var router = LoginRouter(presenter: self)
    private var contentView = UserSignupView()
    
    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        guard let view = Bundle.main.loadNibNamed(
            "UserSignupView",
            owner: self,
            options: nil)?.first as? UserSignupView else { return }
        
        self.contentView = view
        self.view = contentView
    }
    
}
