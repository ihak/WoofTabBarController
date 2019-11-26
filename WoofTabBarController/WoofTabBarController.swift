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
//        let tabView = WoofTabBarView()
//        tabView.backgroundColor = UIColor.blue
//
//        tabView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(tabView)
//        NSLayoutConstraint.activate([
//            tabView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            tabView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            tabView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            tabView.heightAnchor.constraint(equalToConstant: 44.0)
//        ])
//
        let tabBarItem = WoofTabBarItemView()
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.backgroundColor = .random
        self.view.addSubview(tabBarItem)

        NSLayoutConstraint.activate([
//            tabBarItem.heightAnchor.constraint(equalToConstant: 244.0),
//            tabBarItem.widthAnchor.constraint(equalToConstant: 200.0),
            tabBarItem.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tabBarItem.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
//        let view1 = SomeView()
//        view1.backgroundColor = .random
////        view1.heightAnchor.constraint(equalToConstant: 244.0).isActive = true
////        view1.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
//
//        let view2 = SomeView()
//        view2.backgroundColor = .random
//
//        let view3 = SomeView()
//        view3.backgroundColor = .random
//
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillEqually

        stackview.addArrangedSubview(WoofTabBarItemView())
        stackview.addArrangedSubview(WoofTabBarItemView())
        stackview.addArrangedSubview(WoofTabBarItemView())
        stackview.addArrangedSubview(WoofTabBarItemView())
        stackview.addArrangedSubview(WoofTabBarItemView())

        stackview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            stackview.heightAnchor.constraint(equalToConstant: 222)
        ])

    }
}

class SomeView: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30.0, height: 30.0)
    }
}
