//
//  ViewController.swift
//  Example
//
//  Created by Hassan Ahmed on 02/12/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit
import WoofTabBarController

class ViewController: WoofTabBarControllerClass {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.configureTabBarView { (barview) in
//            barview.backgroundColor = .green
//            barview.bezierBackgroundColor = .orange
//            barview.circleBackgroundColor = .cyan
//            barview.bezieranimationDuration = 0.5
//            barview.circleAnimationDuration = 1.5
//            barview.imageTint = .green
//            barview.shadow = (3.0, 0.5, .zero, .gray)
        }
    }

    override func viewControllers() -> [WoofTabBarViewDataSource] {
        return [Tab1Controller(), Tab2Controller(), Tab3Controller(), Tab4Controller(), Tab5Controller()]
    }
}

class Tab1Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Home", image: "home")
    }
}

class Tab2Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Favorites", image: "heart")
    }
}

class Tab3Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Instagram", image: "instagram", notificationCount: 5)
    }
}

class Tab4Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.view.alpha = 0.5
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Like", image: "like")
    }
    
    func addAsAnOverlay() -> Bool {
        return true
    }
}

class Tab5Controller: UIViewController, WoofTabBarViewDataSource {
    override func viewDidLoad() {
        self.view.backgroundColor = .random
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("\(String(describing: type(of: self)))->\(#function) called ")
    }

    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Shopping Cart", image: "shopping-cart")
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
