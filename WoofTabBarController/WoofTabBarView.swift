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
        WoofTabBarItem(title: "You", image: "home")
    ]
    
    let stackView = UIStackView()
    var defaultSelectedIndex = 1
    
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
}

extension WoofTabBarView: WoofTabBarItemViewDelegate {
    func isDefaultItem(itemView: WoofTabBarItemView) -> Bool {
        if let defaultItem = self.stackView.arrangedSubviews[defaultSelectedIndex] as? WoofTabBarItemView {
            guard defaultItem == itemView else {
                return false
            }
            return true
        }
        return false
    }
    
    func didTap(itemView: WoofTabBarItemView) {
        if let index = self.stackView.arrangedSubviews.firstIndex(of: itemView) {
            guard index != selectedIndex else {
                return
            }
            
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
