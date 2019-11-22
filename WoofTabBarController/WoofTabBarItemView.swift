//
//  TabBarItemView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarItemView: UIView {

    var item: WoofTabBarItem?
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let image = UIImageView()
        image.image = UIImage(named: "home")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "title"
        label.font = UIFont(name: "Avenir-Next", size: 13.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 20.0),
            image.heightAnchor.constraint(equalToConstant: 20.0),
        ])
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing   = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(label)

        self.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])

        self.backgroundColor = .random
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 30, height: 30)
//    }
    

}
