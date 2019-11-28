//
//  ParentViewController.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 28/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class ParentViewController: WoofTabBarControllerClass {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewControllers() -> [WoofTabBarViewDataSource] {
        return [Tab1Controller(), Tab2Controller(), Tab3Controller(), Tab4Controller(), Tab5Controller()]
    }
}

class Tab1Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Home", image: "home")
    }
}

class Tab2Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
    }
    
    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Favorites", image: "heart")
    }
}

class Tab3Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Instagram", image: "instagram", notificationCount: 5)
    }
}

class Tab4Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Like", image: "like")
    }
}

class Tab5Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Shopping Cart", image: "shopping-cart")
    }
}
