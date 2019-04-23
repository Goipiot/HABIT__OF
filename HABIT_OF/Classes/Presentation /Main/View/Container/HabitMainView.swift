//
//  HabitMainView.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 05/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

protocol HabitMainViewDelegate: class {
    func editButtonPressed(isEditing: Bool)
}

class HabitMainView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var habitsStackView: UIStackView!
    @IBOutlet weak var calendarStackView: UIStackView!
    var editBarButton: UIBarButtonItem!
    var profileBarButton: UIBarButtonItem!
    var scrollTodayButton: UIButton!
    
    // MARK: - Public Properties
    
    weak var delegate: HabitMainViewDelegate?
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        
        editBarButton = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: nil)
        
        profileBarButton = UIBarButtonItem(
            title: "Profile",
            style: .plain,
            target: self,
            action: nil)
        
        scrollTodayButton = UIButton()
        scrollTodayButton.setTitle("Today", for: .normal)
        scrollTodayButton.setTitleColor(UIColor.customBlue, for: .normal)
        scrollTodayButton.titleLabel?.font = UIFont(name: "ProximaNova-Semibold", size: 15)
    }
    
}
