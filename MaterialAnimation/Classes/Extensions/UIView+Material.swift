//
//  UIView+Material.swift
//  MaterialAnimation
//
//  Created by Oleksandr Nechet on 31.10.15.
//  Copyright © 2015 Oleksandr Nechet. All rights reserved.
//

import UIKit


extension UIView {
    
    func materialAnimationShow(withStartPoint point:CGPoint){
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(rect: self.bounds).CGPath
        self.layer.mask = maskLayer
        maskLayer.addAnimation(self.materialAnimation(startPoint: point), forKey: "path")
    }
    
    func materialAnimationTap(location point:CGPoint, white:CGFloat){
        let animLayer = CALayer()
        animLayer.bounds = self.bounds
        animLayer.position = self.convertPoint(self.center, fromView: self.superview)
        animLayer.backgroundColor = UIColor(white: white, alpha: 0.25).CGColor
        self.layer.addSublayer(animLayer)
        
        let maskLayer = CAShapeLayer()
        animLayer.mask = maskLayer
        maskLayer.addAnimation(self.materialAnimation(startPoint: point), forKey: "path1")
    }
    
    //MARK: - Helpers
    
    private func materialAnimation(startPoint point:CGPoint) -> CABasicAnimation {
        var rect = CGRectZero
        rect.origin = point
        
        //START RADIUS
        //'long' view -  the view with aspect ratio is 1:8 or 8:1
        //for 'long' view animation begin from circle with radius which equal to smaller sides of view.
        //otherwise - animation begin from point
        let proportions = self.bounds.width / self.bounds.height
        var radiusStart = CGFloat(0)
        if proportions >= 8 || proportions <= 1/8 {
            radiusStart = min(self.bounds.size.height, self.bounds.size.width)
        }
        
        //FINAL RADIUS
        let h = self.frame.size.height - rect.size.height
        let w = self.frame.size.width - rect.size.width
        let radiusFinal = sqrt((h * h) + (w * w))

        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = UIBezierPath(ovalInRect: CGRectInset(rect, -radiusStart, -radiusStart)).CGPath
        maskLayerAnimation.toValue = UIBezierPath(ovalInRect: CGRectInset(rect, -radiusFinal, -radiusFinal)).CGPath
        maskLayerAnimation.duration = 1
        return maskLayerAnimation
    }
}

