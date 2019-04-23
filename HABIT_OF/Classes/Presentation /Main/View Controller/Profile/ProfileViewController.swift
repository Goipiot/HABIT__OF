//
//  ProfileViewController.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 23/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var router = HabitRouter(presenter: self)
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    // MARK: - Public Methods
    
    @objc func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - Configure NavigationBar

extension ProfileViewController {
    private func configureNavBar() {
        let logoutBarButton = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(logoutButtonPressed(_:)))
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = logoutBarButton
        title = "Profile"
    }
}
