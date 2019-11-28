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
        
        let viewcontrollers = [Tab1Controller(), Tab2Controller()]
        var barItems = [WoofTabBarItem]()
        for vc in viewcontrollers {
            if let vc = vc as? WoofTabBarControllerDataSource {
                barItems.append(vc.woofTabBarItem())
            }
        }
        
        let tabView = WoofTabBarView(barItems: barItems)
        tabView.backgroundColor = UIColor.white
        
        tabView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabView)
        NSLayoutConstraint.activate([
            tabView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tabView.heightAnchor.constraint(equalToConstant: 60.0)
        ])
    }    
}

protocol WoofTabBarControllerDataSource {
    func woofTabBarItem() -> WoofTabBarItem
}

class Tab1Controller: UIViewController, WoofTabBarControllerDataSource {
    public func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Tab 1", image: "home")
    }
}

class Tab2Controller: UIViewController, WoofTabBarControllerDataSource {
    public func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Tab 2", image: "heart")
    }
}
