//
//  UIView+Material.swift
//  MaterialAnimation
//
//  Created by Oleksandr Nechet on 31.10.15.
//  Copyright © 2015 Oleksandr Nechet. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch = touches.first
        let location = touch?.locationInView(self)
        self.materialAnimationTap(location: location!, white: 0)
    }
}
