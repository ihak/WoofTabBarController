//
//  ViewController.swift
//  Example
//
//  Created by Hassan Ahmed on 02/12/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit
import WoofTabBarController

class ViewController: WoofTabBarController {
    
    override var defaultIndex: Int { 4 }
    
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

    override func viewControllers() -> [WoofTabControllerItem] {
        return [Tab1Controller(), Tab2Controller(), Tab3Controller(), Tab4Controller(), Tab5Controller()]
    }
}

class Tab1Controller: UIViewController, WoofTabBarControllerDataSource, WoofTabBarControllerDelegate {
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
        return WoofTabBarItem(title: "Home", image: "home")
    }
}

class Tab2Controller: UIViewController, WoofTabBarControllerDataSource, WoofTabBarControllerDelegate {
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
    
    func shouldAnimate() -> Bool {
        return false
    }
    
    func shouldHighlight() -> Bool {
        return false
    }
}

class Tab3Controller: UIViewController, WoofTabBarControllerDataSource, WoofTabBarControllerDelegate {
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

class Tab4Controller: UIViewController, WoofTabBarControllerDataSource, WoofTabBarControllerDelegate {
    var addsAsAnOverlay: Bool {
        return true
    }

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
    
    func shouldSelect() -> Bool {
        return true
    }
    
    func shouldAnimate() -> Bool {
        return true
    }
}

class Tab5Controller: UIViewController, WoofTabBarControllerDataSource, WoofTabBarControllerDelegate {
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
