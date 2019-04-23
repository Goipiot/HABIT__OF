//
//  HabitPointCollectionViewCell.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 15/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class HabitPointCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlet
    
    @IBOutlet weak var selectionEffectView: UIView!
    @IBOutlet weak var habitPointView: UIView!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override var isSelected: Bool {
        didSet {
            selectionEffectView.isHidden = !isSelected
        }
    }
    
    // MARK: - Public Method
    
    public func configure(with vm: HabitDayViewModel) {
        habitPointView.backgroundColor = vm.color
        if habitPointView.backgroundColor == UIColor.white {
            habitPointView.layer.borderWidth = 1
        } else {
            habitPointView.layer.borderWidth = 0
        }
    }
    
    // MARK: - Private Method
    
    private func setup() {
        self.backgroundColor = .clear
        selectionEffectView.layer.cornerRadius = selectionEffectView.frame.width / 2
        selectionEffectView.layer.masksToBounds = true
        selectionEffectView.isHidden = true
        habitPointView.layer.masksToBounds = true
        habitPointView.layer.cornerRadius = habitPointView.frame.width / 2
        habitPointView.layer.borderColor = UIColor.black.cgColor
    }
}
