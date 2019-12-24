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
        delegate = self
        self.configureTabBarView { (barview) in
//            barview.backgroundColor = .green
//            barview.bezierBackgroundColor = .orange
//            barview.circleBackgroundColor = .cyan
//            barview.imageSize = CGSize(width: 30.0, height: 30.0)
//            barview.labelFont = .boldSystemFont(ofSize: 13.0)
//            barview.notificationLabelFont = .systemFont(ofSize: 9.0)
//            barview.notificationBubbleOffset = CGSize(width: -10.0, height: -3.0)
//            barview.bezieranimationDuration = 0.5
//            barview.circleAnimationDuration = 1.5
//            barview.imageTint = .green
//            barview.selectedImageTint = .yellow
//            barview.shadow = (3.0, 0.5, .zero, .gray)
        }
    }

    override func viewControllers() -> [WoofTabControllerItem] {
        return [Tab1Controller(), Tab2Controller(), Tab3Controller(), Tab4Controller(), Tab5Controller()]
    }
}

extension ViewController: WoofTabBarControllerBarViewDelegate {
    func shouldSelectItem(itemView: WoofTabBarItemView, destinationVC: WoofTabBarController.WoofTabControllerItem, atIndex: Int) -> Bool {
        if atIndex == 2 {
            return false
        }
        return true
    }
    
    func shouldHighlightItem(itemView: WoofTabBarItemView, destinationVC: WoofTabBarController.WoofTabControllerItem, atIndex: Int) -> Bool {
        true
    }
    
    func shouldAnimateItem(itemView: WoofTabBarItemView, destinationVC: WoofTabBarController.WoofTabControllerItem, atIndex: Int) -> Bool {
        true
    }
    
    func didSelectItem(itemView: WoofTabBarItemView, destinationVC: WoofTabBarController.WoofTabControllerItem, atIndex: Int) {
        print("Selected \(atIndex)")
    }
    
    func didDeSelectItem(itemView: WoofTabBarItemView, vc: WoofTabBarController.WoofTabControllerItem, atIndex: Int) {
        print("De-Selected \(atIndex)")
    }
    
    func didAnimateItem(itemView: WoofTabBarItemView, destinationVC: WoofTabBarController.WoofTabControllerItem, atIndex: Int) {
        print("Ainmated \(atIndex)")
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
        return WoofTabBarItem(title: "Home", image: "home", selectedImage: "home-f")
    }
}

class Tab2Controller: UIViewController, WoofTabBarControllerDataSource, WoofTabBarControllerDelegate {
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
        return WoofTabBarItem(title: "Favorites", image: "heart", selectedImage: "heart-f", notificationCount: 3)
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
        return WoofTabBarItem(title: "Instagram", image: "instagram", selectedImage: "instagram-f", notificationCount: 5)
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
        return WoofTabBarItem(title: "Like", image: "like", selectedImage: "like-f")
    }
    
    func shouldSelect() -> Bool {
        return false
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
        return WoofTabBarItem(title: "Shopping Cart", image: "shopping-cart", selectedImage: "shopping-cart-f")
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
