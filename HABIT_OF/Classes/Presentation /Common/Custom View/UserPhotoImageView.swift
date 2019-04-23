//
//  UserPhotoView.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 23/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class UserPhotoImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width * 0.5
        clipsToBounds = true
    }

}
