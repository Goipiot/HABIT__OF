//
//  CreateHabitTableViewCell.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 10/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

protocol CreateHabitTableViewCellDelegate: class {
    func addNewHabitButtonPressed()
}

class CreateHabitTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var newHabitButton: UIButton!
    
    // MARK: - Public Properties
    
    weak var delegate: CreateHabitTableViewCellDelegate?
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newHabitButton.layer.cornerRadius = 8
    }
    
    // MARK: - IBAction
    
    @IBAction func addNewHabitButtonPressed(_ sender: UIButton) {
        delegate?.addNewHabitButtonPressed()
    }
    
}
