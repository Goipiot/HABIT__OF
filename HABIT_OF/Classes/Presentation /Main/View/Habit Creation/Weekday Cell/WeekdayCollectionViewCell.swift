//
//  WeekdayCollectionViewCell.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 24/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class WeekdayCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var weekdayLabel: UILabel!
    
    // MARK: - UICollectionViewCell
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                weekdayLabel.textColor = .black
                layer.borderWidth = 2
                backgroundColor = .white
            } else {
                weekdayLabel.textColor = UIColor.lightGray
                layer.borderWidth = 0
                backgroundColor = UIColor.customGrey
            }
        }
    }
    
    override func awakeFromNib() {
        layer.masksToBounds = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 10
        layer.borderColor = UIColor.customBlue.cgColor
    }
    
}
