//
//  WoofTabController.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarController: UIViewController {
    
    @IBOutlet weak var tabBarView: WoofTabBarView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tabView = WoofTabBarView()
        tabView.backgroundColor = UIColor.blue
        
        tabView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabView)
        NSLayoutConstraint.activate([
            tabView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tabView.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        let tabBarItem = WoofTabBarItemView()
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.backgroundColor = .random
        self.view.addSubview(tabBarItem)
    }

}
