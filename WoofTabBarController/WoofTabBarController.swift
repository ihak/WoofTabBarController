//
//  WoofTabController.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabView = WoofTabBarView()
        tabView.backgroundColor = UIColor.white
        
        tabView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabView)
        NSLayoutConstraint.activate([
            tabView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tabView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
        
//        let bezierView = BezierView()
//        bezierView.translatesAutoresizingMaskIntoConstraints = false
//        tabView.addSubview(bezierView)
//
//        NSLayoutConstraint.activate([
//            bezierView.leadingAnchor.constraint(equalTo: tabView.leadingAnchor),
//            bezierView.trailingAnchor.constraint(equalTo: tabView.trailingAnchor),
//            bezierView.bottomAnchor.constraint(equalTo: tabView.bottomAnchor),
//            bezierView.topAnchor.constraint(equalTo: tabView.topAnchor)
//        ])
//
//        self.view.setNeedsLayout()
//        self.view.layoutIfNeeded()
//        bezierView.addShapeLayer()
    }
    
    @IBAction func changePathPosition(_ sender: Any) {
       
    }
}
