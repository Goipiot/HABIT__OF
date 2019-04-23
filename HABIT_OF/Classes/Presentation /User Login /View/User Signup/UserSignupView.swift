//
//  UserSignupView.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 28/02/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class UserSignupView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - UIView
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    // MARK: - IBAction
    
    @IBAction func signupButtonPressed(_ sender: UIButton) {
        if Validator.isValidEmail(testStr: emailTextField.text ?? "") {
            
        } else {
            warningLabel.isHidden = false
        }
    }
    
    // MARK: - UI Setup
    
    private func setup() {
        
    }
}

// MARK: - UITextField Delegate

extension UserSignupView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 150)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 150)
        warningLabel.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func animateViewMoving(up: Bool, moveValue: CGFloat) {
        
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        
        self.frame = self.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
}
