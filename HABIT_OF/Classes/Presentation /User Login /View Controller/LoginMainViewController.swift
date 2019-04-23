//
//  LoginMainViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class LoginMainViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var router = LoginRouter(presenter: self)
    private var contentView = LoginMainView()
    
    // MARK: - UIViewController
    
    override func loadView() {
        super.loadView()
        guard let view = Bundle.main.loadNibNamed(
            "LoginMainView",
            owner: self,
            options: nil)?.first as? LoginMainView else { return }
        
        self.contentView = view
        self.view = contentView
    }
    
    // MARK: - IBAction
    
    @IBAction func emailRegistrationButtonPressed(_ sender: UIButton) {
        router.show(viewController: UserSignupViewController())
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        router.show(viewController: UserLoginViewController())
    }
    
}
