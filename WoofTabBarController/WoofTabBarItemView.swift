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

        self.backgroundColor = .random
    }
    
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: 30, height: 30)
//    }
    

}
