//
//  LoginMainView.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class LoginMainView: UIView {
    
    // MARK: - IBOutlet
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var haveAnAccountView: UIView!
    
    // MARK: - UIView
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    // MARK: - UI Setup
    func setup() {
        facebookButton.layer.cornerRadius = 8
        emailButton.layer.cornerRadius = 8
        haveAnAccountView.layer.cornerRadius = 8
        haveAnAccountView.layer.borderWidth = 0.1
        haveAnAccountView.layer.borderColor = UIColor.customGrey.cgColor
        
    }

}
