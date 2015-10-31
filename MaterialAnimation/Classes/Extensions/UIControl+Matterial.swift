//
//  UIView+Material.swift
//  MaterialAnimation
//
//  Created by Oleksandr Nechet on 31.10.15.
//  Copyright © 2015 Oleksandr Nechet. All rights reserved.
//

import UIKit

extension UIControl {
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        let touch = touches.first
        let point = touch?.locationInView(self)
        self.materialAnimationTap(location: point!, white: 0)
    }
}
