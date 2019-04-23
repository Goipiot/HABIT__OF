//
//  UIButton+Extension.swift
//  HABIT_OF
//
//  Created by Anton Danilov on 16/04/2019.
//  Copyright © 2019 Anton Danilov. All rights reserved.
//

import UIKit

extension UIButton {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
