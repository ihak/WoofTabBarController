//
//  BezierView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 27/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class BezierView: UIView {
    
    private let shapeLayer = CAShapeLayer()
    private var initialPosition: CGFloat = 70

    private var shapeBackgroundColor = UIColor.white.cgColor
    private var animationDuration = 0.15
    
    func addShapeLayer() {
        shapeLayer.path = curveShapePath(postion: initialPosition)
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = shapeBackgroundColor
        self.layer.addSublayer(shapeLayer)
    }
    
    private func curveShapePath(postion: CGFloat) -> CGPath {
        let height: CGFloat = 37.0
        let path = UIBezierPath()

        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (postion - height * 2), y: 0)) // the beginning of the trough

        // first curve down
        path.addCurve(to: CGPoint(x: postion, y: height),
                      controlPoint1: CGPoint(x: (postion - 30), y: 0), controlPoint2: CGPoint(x: postion - 35, y: height))
        // second curve up
        path.addCurve(to: CGPoint(x: (postion + height * 2), y: 0),
                      controlPoint1: CGPoint(x: postion + 35, y: height), controlPoint2: CGPoint(x: (postion + 30), y: 0))

        // complete the rect
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()

        return path.cgPath
    }
    
    private func animateShape(position: CGFloat) {
        let newShapePath = curveShapePath(postion: position)
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = animationDuration
        animation.toValue = newShapePath
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        self.shapeLayer.add(animation, forKey: "path")
    }
    
    func shapeBackgroundColor(color: UIColor) {
        self.shapeBackgroundColor = color.cgColor
    }
    
    func animationDuration(duration: Double) {
        animationDuration = duration
    }
    
    func moveCurve(to position: CGFloat) {
        self.initialPosition = position
        self.animateShape(position: position)
    }
    
    func shadow(opacity: Double = 0.0, radius: Double = 0.0, offset: CGSize = .zero, color: UIColor = .clear) {
        shapeLayer.shadowRadius = CGFloat(radius)
        shapeLayer.shadowColor = color.cgColor
        shapeLayer.shadowOffset = offset
        shapeLayer.shadowOpacity = Float(opacity)
    }
}

extension BezierView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.shapeLayer.path = curveShapePath(postion: initialPosition)
    }
}
