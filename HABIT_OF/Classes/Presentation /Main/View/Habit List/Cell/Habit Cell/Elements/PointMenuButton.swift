//
//  PointMenuButton.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 16/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

class PointMenuButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.tag == 0 {
            self.roundCorners([.topLeft, .bottomLeft], radius: 8)
        } else {
            self.roundCorners([.topRight, .bottomRight], radius: 8)
        }
        
    }
}
