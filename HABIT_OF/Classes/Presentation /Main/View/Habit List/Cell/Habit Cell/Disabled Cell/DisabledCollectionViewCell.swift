//
//  DisabledCollectionViewCell.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 17/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class DisabledCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var habitPointView: UIView!
    
    // MARK: - UICollectionViewCell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        habitPointView.layer.masksToBounds = true
        habitPointView.backgroundColor = .black
        habitPointView.layer.cornerRadius = habitPointView.frame.width / 2
    }

}
