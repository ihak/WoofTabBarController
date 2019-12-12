//
//  WoofTabController.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

open class WoofTabBarControllerClass: UIViewController {
    private var tabViewControllers = [WoofTabBarViewDataSource]()
    
    var tabBarView: WoofTabBarView!
    var currentTabVC: UIViewController!
    var tabContainerView = UIView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tabContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabContainerView)
        tabContainerView.backgroundColor = .random
        NSLayoutConstraint.activate([
            tabContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabContainerView.topAnchor.constraint(equalTo: self.view.topAnchor),
        ])

        tabViewControllers = viewControllers()
        var barItems = [WoofTabBarItem]()
        for vc in tabViewControllers {
            barItems.append(vc.woofTabBarItem())
        }
        
        tabBarView = WoofTabBarView(barItems: barItems)
        tabBarView.backgroundColor = .clear
        tabBarView.delegate = self
        
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabBarView)
        NSLayoutConstraint.activate([
            tabBarView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabBarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            tabBarView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tabContainerView.bottomAnchor.constraint(equalTo: tabBarView.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        guard currentTabVC != nil else {
            replaceTabVC(withTabVCAt: 0)
            return
        }
    }
    
    open func viewControllers() -> [WoofTabBarViewDataSource] {
        return [WoofTab1Controller(), WoofTab2Controller()]
    }

    open func configureTabBarView(block: @escaping (_ tabBarView: WoofTabBarView)->Void) {
        block(tabBarView)
    }
    
    func replaceTabVC(withTabVCAt index:Int) {
        let vc = self.tabViewControllers[index]
        let view = vc.view!

        view.translatesAutoresizingMaskIntoConstraints = false
        tabContainerView.addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: tabContainerView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tabContainerView.trailingAnchor),
            view.topAnchor.constraint(equalTo: tabContainerView.topAnchor),
            view.bottomAnchor.constraint(equalTo: tabContainerView.bottomAnchor),
        ])
        
        self.currentTabVC = vc
    }
}

public protocol WoofTabBarViewDataSource: UIViewController {
    func woofTabBarItem() -> WoofTabBarItem
}

class WoofTab1Controller: UIViewController, WoofTabBarViewDataSource {
    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Tab 1", image: "")
    }
}

class WoofTab2Controller: UIViewController, WoofTabBarViewDataSource {
    func woofTabBarItem() -> WoofTabBarItem {
        return WoofTabBarItem(title: "Tab 2", image: "")
    }
}

extension WoofTabBarControllerClass: WoofTabBarViewDelegate {
    func didSelectItem(itemView: WoofTabBarItemView, atIndex: Int) {
        // replace previous vc with the new one
        replaceTabVC(withTabVCAt:atIndex) 
    }
}
