//
//  MoreVC.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 26/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {

    var isToggle: Bool = true
    var activeConstraints: [NSLayoutConstraint] = []
    var inActiveConstraints: [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let optionButton1 = UIButton()
        optionButton1.setTitle("1", for: .normal)
        optionButton1.setTitleColor(.white, for: .normal)
        optionButton1.backgroundColor = .red
        optionButton1.layer.cornerRadius = 25.0
        optionButton1.titleLabel?.font = .boldSystemFont(ofSize: 25)
        optionButton1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(optionButton1)
        
        let optionButton2 = UIButton()
        optionButton2.setTitle("2", for: .normal)
        optionButton2.setTitleColor(.white, for: .normal)
        optionButton2.backgroundColor = .brown
        optionButton2.layer.cornerRadius = 25.0
        optionButton2.titleLabel?.font = .boldSystemFont(ofSize: 25)
        optionButton2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(optionButton2)
        
        let optionButton3 = UIButton()
        optionButton3.setTitle("3", for: .normal)
        optionButton3.setTitleColor(.white, for: .normal)
        optionButton3.backgroundColor = .gray
        optionButton3.layer.cornerRadius = 25.0
        optionButton3.titleLabel?.font = .boldSystemFont(ofSize: 25)
        optionButton3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(optionButton3)
        
        let moreButton = UIButton()
        moreButton.setTitle("+", for: .normal)
        moreButton.setTitleColor(.white, for: .normal)
        moreButton.backgroundColor = .orange
        moreButton.layer.cornerRadius = 25.0
        moreButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        moreButton.addTarget(self, action: #selector(moreTapped), for: .touchUpInside)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            moreButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -12.0),
            moreButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -12.0),
            moreButton.widthAnchor.constraint(equalToConstant: 50.0),
            moreButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
        
        // constriants to show more options buttons
        self.activeConstraints = [
            optionButton1.bottomAnchor.constraint(equalTo: moreButton.topAnchor, constant: -8),
            optionButton1.centerXAnchor.constraint(equalTo: moreButton.centerXAnchor),
            optionButton1.widthAnchor.constraint(equalToConstant: 50.0),
            optionButton1.heightAnchor.constraint(equalToConstant: 50.0),
            
            optionButton2.bottomAnchor.constraint(equalTo: optionButton1.topAnchor, constant: -8),
            optionButton2.centerXAnchor.constraint(equalTo: moreButton.centerXAnchor),
            optionButton2.widthAnchor.constraint(equalToConstant: 50.0),
            optionButton2.heightAnchor.constraint(equalToConstant: 50.0),
            
            optionButton3.bottomAnchor.constraint(equalTo: optionButton2.topAnchor, constant: -8),
            optionButton3.centerXAnchor.constraint(equalTo: moreButton.centerXAnchor),
            optionButton3.widthAnchor.constraint(equalToConstant: 50.0),
            optionButton3.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        // constriants to hide more options buttons
        self.inActiveConstraints = [
            optionButton1.centerYAnchor.constraint(equalTo: moreButton.centerYAnchor),
            optionButton1.centerXAnchor.constraint(equalTo: moreButton.centerXAnchor),
            optionButton1.widthAnchor.constraint(equalToConstant: 50.0),
            optionButton1.heightAnchor.constraint(equalToConstant: 50.0),
            
            optionButton2.centerYAnchor.constraint(equalTo: moreButton.centerYAnchor),
            optionButton2.centerXAnchor.constraint(equalTo: moreButton.centerXAnchor),
            optionButton2.widthAnchor.constraint(equalToConstant: 50.0),
            optionButton2.heightAnchor.constraint(equalToConstant: 50.0),
            
            optionButton3.centerYAnchor.constraint(equalTo: moreButton.centerYAnchor),
            optionButton3.centerXAnchor.constraint(equalTo: moreButton.centerXAnchor),
            optionButton3.widthAnchor.constraint(equalToConstant: 50.0),
            optionButton3.heightAnchor.constraint(equalToConstant: 50.0),
        ]
        
        // first set inactive constraint to hide more option buttons
        NSLayoutConstraint.activate(self.inActiveConstraints)
    }

    @objc func moreTapped() {
        if isToggle {
            NSLayoutConstraint.deactivate(self.inActiveConstraints)
            NSLayoutConstraint.activate(self.activeConstraints)
        } else {
            NSLayoutConstraint.deactivate(self.activeConstraints)
            NSLayoutConstraint.activate(self.inActiveConstraints)
        }
        isToggle = !isToggle
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}
