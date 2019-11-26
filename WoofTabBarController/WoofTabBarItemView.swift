//
//  TabBarItemView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarItemView: UIView {

    var item: WoofTabBarItem?
    override func draw(_ rect: CGRect) {
        backgroundColor = .random
        
        let containerView = UIView()
        containerView.backgroundColor = .orange
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5.0
                
        let imageContainer = UIView()
        
        let image = UIImageView(image: UIImage(named: "home"))
        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            image.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor)
        ])
        
        let notificationBubbleContainer = UIView()
        notificationBubbleContainer.translatesAutoresizingMaskIntoConstraints = false
        notificationBubbleContainer.layer.cornerRadius = 12.5
        notificationBubbleContainer.backgroundColor = .random
        
        imageContainer.addSubview(notificationBubbleContainer)
        NSLayoutConstraint.activate([
            notificationBubbleContainer.heightAnchor.constraint(equalToConstant: 25.0),
            notificationBubbleContainer.widthAnchor.constraint(equalToConstant: 25.0),
            notificationBubbleContainer.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            notificationBubbleContainer.leadingAnchor.constraint(equalTo: image.trailingAnchor)
        ])
        
        
        let notificationBubbleLabel = UILabel()
        notificationBubbleLabel.textAlignment = .center
        notificationBubbleLabel.text = "99"
        notificationBubbleLabel.minimumScaleFactor = 0.5
        notificationBubbleLabel.adjustsFontSizeToFitWidth = true
        
        notificationBubbleLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationBubbleContainer.addSubview(notificationBubbleLabel)
        NSLayoutConstraint.activate([
            notificationBubbleLabel.topAnchor.constraint(equalTo: notificationBubbleContainer.topAnchor, constant: 3.0),
            notificationBubbleLabel.bottomAnchor.constraint(equalTo: notificationBubbleContainer.bottomAnchor, constant: -3.0),
            notificationBubbleLabel.leadingAnchor.constraint(equalTo: notificationBubbleContainer.leadingAnchor, constant: 3.0),
            notificationBubbleLabel.trailingAnchor.constraint(equalTo: notificationBubbleContainer.trailingAnchor, constant: -3.0)
        ])
        
        let label = UILabel()
        label.text = "title"
        label.font = UIFont(name: "Avenir-Next", size: 13.0)
        label.textAlignment = .center
        label.textColor = .black
        label.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        stackView.addArrangedSubview(imageContainer)
        stackView.addArrangedSubview(label)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 50.0, height: 44.0)
    }
}
