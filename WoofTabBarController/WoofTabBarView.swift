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
        WoofTabBarItem(title: "Hello", image: "home"),
        WoofTabBarItem(title: "Hello", image: "home")
    ]
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        for item in barItems {
            let barItemView = WoofTabBarItemView()
            stackView.addArrangedSubview(barItemView)
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
