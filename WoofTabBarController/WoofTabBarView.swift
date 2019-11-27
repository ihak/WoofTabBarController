//
//  WoofTabView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarView: UIView {

    var barItems = [
        WoofTabBarItem(title: "Hello", image: "home"),
        WoofTabBarItem(title: "World", image: "home"),
        WoofTabBarItem(title: "You", image: "home"),
        WoofTabBarItem(title: "You", image: "home"),
        WoofTabBarItem(title: "You", image: "home")
    ]
    
    let bezierView = BezierView()
    let stackView = UIStackView()
    var defaultSelectedIndex = 0
    
    var selectedIndex = -1 {
        didSet {
            guard oldValue > -1 else {
                return
            }
            unSelectItem(index: oldValue)
        }
    }
        
    override func layoutSubviews() {
        guard stackView.superview == nil else {
            return
        }
        self.backgroundColor = .clear
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        for item in barItems {
            let barItemView = WoofTabBarItemView()
            barItemView.item = item
            barItemView.delegate = self
            stackView.addArrangedSubview(barItemView)            
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        bezierView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(bezierView, belowSubview: stackView)
        
        NSLayoutConstraint.activate([
            bezierView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bezierView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bezierView.topAnchor.constraint(equalTo: self.topAnchor),
            bezierView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        bezierView.addShapeLayer()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300.0, height: 60.0)
    }
    
    private func unSelectItem(index: Int) {
        if let item = self.stackView.arrangedSubviews[index] as? WoofTabBarItemView {
            item.unSelect()
        }
    }
    
    private func selectItem(index: Int, animated: Bool) {
        if let item = self.stackView.arrangedSubviews[index] as? WoofTabBarItemView {
            item.select(animated: animated)
        }
    }
    
    private func changeCurveShape(position: CGPoint) {
        bezierView.moveCurve(to: position.x)
    }
}

extension WoofTabBarView: WoofTabBarItemViewDelegate {
    func isDefaultItem(itemView: WoofTabBarItemView) -> Bool {
        if let defaultItem = self.stackView.arrangedSubviews[defaultSelectedIndex] as? WoofTabBarItemView {
            guard defaultItem == itemView else {
                return false
            }
            self.changeCurveShape(position: itemView.center)
            self.selectedIndex = defaultSelectedIndex
            return true
        }
        return false
    }
    
    func didTap(itemView: WoofTabBarItemView) {
        if let index = self.stackView.arrangedSubviews.firstIndex(of: itemView) {
            guard index != selectedIndex else {
                return
            }
            self.changeCurveShape(position: itemView.center)
            self.selectedIndex = index
            print("selected index", selectedIndex)
        }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
