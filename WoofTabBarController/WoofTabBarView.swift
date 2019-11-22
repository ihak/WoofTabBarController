//
//  WoofTabView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarView: UIView {

    var items = [WoofTabBarItem]()
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing   = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0...4 {
            let tabItem = WoofTabBarItemView()
            //tabItem.item = WoofTabBarItem(title: "Home", image: "home")
            stackView.addArrangedSubview(tabItem)
        }
        
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
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
