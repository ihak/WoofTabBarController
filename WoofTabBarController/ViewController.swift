//
//  ViewController.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 26/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillEqually

        stackview.addArrangedSubview(getSomeView())
        stackview.addArrangedSubview(getSomeView())
        stackview.addArrangedSubview(getSomeView())

        stackview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackview.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        let someContainerView = SomeContainerview()
        someContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(someContainerView)
        NSLayoutConstraint.activate([
            someContainerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            someContainerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100),
            someContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            someContainerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            someContainerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            someContainerView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func getSomeView() -> SomeView {
        let view = SomeView()
        view.backgroundColor = .random
        return view
    }
}

class SomeView: UIView {
    class func getSomeView() -> SomeView {
        let view = SomeView()
        view.backgroundColor = .random
        return view
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let uiview = UIView()
        uiview.backgroundColor = .random
        
        uiview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(uiview)
        
        NSLayoutConstraint.activate([
            uiview.topAnchor.constraint(equalTo: self.topAnchor),
            uiview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            uiview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            uiview.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30.0, height: 30.0)
    }
}

/*
1. If you are adding your custom class in a UIStackView, override intrinsicContentSize method to
 provide initial size. Your views will be resized later according to the axis, alignment and distribution properties of stackview but intrinsic content size is necessary to draw the views first time.
 
2. If you don't override intrinsicContentSize property, give your stackview an explicit height.
*/

/*
 1. If you don't provide height constraint to your view, draw(_ rect:) is not called.
 2. If your view couldn't infer its height from its applied constraints, draw(_ rect:) is not called.
 3. If your view doesn't override intrinsicContentSize method along with above two points, draw(_ rect:) is not called.
 
 Even if you plan to add subviews in your custom view in draw(_ rect:) method which inturn
 help to calculate your custom view's size giving their intrinsic sizes and constraints
 with the custom view but since draw(_ rect:) is not called in the first place,
 nothing will materialize in your view.
 */

class SomeContainerview: UIView {
    let stackview = UIStackView()
    var shouldAddConstraints = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillEqually

        stackview.addArrangedSubview(SomeView.getSomeView())
        stackview.addArrangedSubview(SomeView.getSomeView())
        stackview.addArrangedSubview(SomeView.getSomeView())

        stackview.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stackview.topAnchor.constraint(equalTo: self.topAnchor),
//            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//        ])
    }
    
    override func updateConstraints() {
        
        guard shouldAddConstraints else {
            super.updateConstraints()

            return
        }
        
        stackview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackview)

        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        shouldAddConstraints = false
        super.updateConstraints()
    }

    override func layoutSubviews() {
        stackview.axis = .horizontal
        stackview.alignment = .fill
        stackview.distribution = .fillEqually

        stackview.addArrangedSubview(SomeView.getSomeView())
        stackview.addArrangedSubview(SomeView.getSomeView())
        stackview.addArrangedSubview(SomeView.getSomeView())

        stackview.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: self.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackview.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30.0, height: 60.0)
    }
}
