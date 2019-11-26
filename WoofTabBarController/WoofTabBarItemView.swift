//
//  TabBarItemView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

class WoofTabBarItemView: UIView {

    var item: WoofTabBarItem!
    var imageContainer: UIView!
    
    var delegate: WoofTabBarItemViewDelegate?
    
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
        
        // contains icon image and notification bubble view
        // receives touches and animates
        imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageContainer)
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(equalToConstant: 60.0),
            imageContainer.widthAnchor.constraint(equalToConstant: 60),
            imageContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        imageContainer.layer.cornerRadius = 30.0
        imageContainer.clipsToBounds = true
        imageContainer.backgroundColor = .random
        
        // Add tap gesture to imageContainer view
        addTapGesture(view: imageContainer)
        
        let image = UIImageView(image: UIImage(named: "home"))
        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        image.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 15.0),
            image.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -15.0),
            image.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15.0),
            image.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -15.0)
        ])
        
        let notificationBubbleContainer = UIView()
        notificationBubbleContainer.translatesAutoresizingMaskIntoConstraints = false
        notificationBubbleContainer.layer.cornerRadius = 12.5
        notificationBubbleContainer.backgroundColor = .random
        
        imageContainer.addSubview(notificationBubbleContainer)
        NSLayoutConstraint.activate([
            notificationBubbleContainer.heightAnchor.constraint(equalToConstant: 25.0),
            notificationBubbleContainer.widthAnchor.constraint(equalToConstant: 25.0),
            notificationBubbleContainer.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 10.0),
            notificationBubbleContainer.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: -15.0)
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
        
        if delegate?.isDefaultItem(itemView: self) == true {
            self.select(animated: false)
        }
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: 50.0, height: 70.0)
    }
    
    private func addTapGesture(view: UIView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func animateContainerUp(duration: Double = 0.2) {
        UIView.animate(withDuration: duration, animations: {
            self.imageContainer.transform = CGAffineTransform(translationX: 0.0, y: -25.0)
        }) { (_) in
            UIView.animate(withDuration: duration, animations: {
                self.imageContainer.transform = CGAffineTransform(translationX: 0.0, y: -20.0)
            }) { (_) in
                self.delegate?.didAnimate(itemView: self)
            }
        }
    }
    
    private func animateContainerBack(duration: Double = 0.2) {
        UIView.animate(withDuration: duration, animations: {
            self.imageContainer.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    @objc private func handleTap() {
        guard let delegate = self.delegate else {
            animateContainerUp()
            return
        }
        
        if delegate.shouldTap(itemView: self) {
            if delegate.shouldAnimate(itemView: self) {
                animateContainerUp()
            }
            else {
                animateContainerUp(duration: 0.0)
            }
            
            delegate.didTap(itemView: self)
        }
    }
    
    func unSelect(animated: Bool = true) {
        if animated == false {
            animateContainerBack(duration: 0.0)
        }
        else {
            animateContainerBack()
        }
    }
    
    func select(animated: Bool = true) {
        if animated == false {
            animateContainerUp(duration: 0.0)
        }
        else {
            animateContainerUp()
        }
    }
}

protocol WoofTabBarItemViewDelegate {
    func isDefaultItem(itemView: WoofTabBarItemView) -> Bool
    func didTap(itemView: WoofTabBarItemView)
    func shouldTap(itemView: WoofTabBarItemView) -> Bool
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool
    func didAnimate(itemView: WoofTabBarItemView)
}

extension WoofTabBarItemViewDelegate {
    func didTap(itemView: WoofTabBarItemView) {
        
    }
    
    func shouldTap(itemView: WoofTabBarItemView) -> Bool {
        return true
    }
    
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool {
        return true
    }
    
    func didAnimate(itemView: WoofTabBarItemView) {
        
    }
}
