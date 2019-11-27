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

    func addShapeLayer() {
        shapeLayer.path = curveShapePath(postion: initialPosition)
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.red.cgColor
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
        animation.duration = 0.2
        animation.toValue = newShapePath
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        self.shapeLayer.add(animation, forKey: "path")
    }
    
    func moveCurve(to position: CGFloat) {
        self.initialPosition = position
        self.animateShape(position: position)
    }
}

extension BezierView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.shapeLayer.path = curveShapePath(postion: initialPosition)
    }
}
