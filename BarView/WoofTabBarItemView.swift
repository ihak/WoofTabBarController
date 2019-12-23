//
//  TabBarItemView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

public class WoofTabBarItemView: UIView {

    // Model object that corresponds with the view.
    var item: WoofTabBarItem!
    
    // Contains the image and notification view.
    private var imageContainer = UIView()
    
    // Icon image.
    private var imageView = UIImageView()
    
    // Circular view that highlights when item is selected.
    private var backCircleView = UIView()
    
    // Circular notification bubble view.
    private var notificationBubbleContainer = UIView()
    
    // Notification bubble textlabel.
    private var notificationBubbleLabel = UILabel()
    
    // Background color of the back circle.
    var circleBackgroundColor = UIColor.white {
        didSet {
            self.backCircleView.backgroundColor = circleBackgroundColor
        }
    }
    
    // Background color of the notification bubble.
    var notificationBubbleBackgroundClor = UIColor.orange {
        didSet {
            self.notificationBubbleContainer.backgroundColor = notificationBubbleBackgroundClor
        }
    }
    
    // Text color of the notification label.
    var notificationTextColor = UIColor.white {
        didSet {
            self.notificationBubbleLabel.textColor = notificationTextColor
        }
    }
    
    // Image tint color. Image rendering mode is automatically
    // set to template when tint color is set.
    var imageTintColor: UIColor? {
        didSet {
            applyTint(color: imageTintColor)
        }
    }
    
    // Image tint color. Image rendering mode is automatically
    // set to template when tint color is set.
    var selectedImageTintColor: UIColor?

    // Circle up and down animation duration
    private var circleAnimationDuration = 0.2
    
    var delegate: WoofTabBarItemViewDelegate?
    
    override public func draw(_ rect: CGRect) {
        guard imageContainer.superview == nil else {
            return
        }
        
        backgroundColor = .clear
        let containerView = UIView()
        containerView.backgroundColor = .clear
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
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(imageContainer)
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(equalToConstant: 40.0),
            imageContainer.widthAnchor.constraint(equalToConstant: 40.0),
            imageContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -8.0)
        ])
        
        imageContainer.layer.cornerRadius = 20.0
        imageContainer.clipsToBounds = true
        imageContainer.backgroundColor = .clear
        
        // Add tap gesture to imageContainer view
        addTapGesture(view: imageContainer)
        
        // circle container view - hides the circle view when its below the bar
        // by cliping bounds.
        let backCircleContainer = UIView()
        backCircleContainer.clipsToBounds = false
        backCircleContainer.translatesAutoresizingMaskIntoConstraints = false
        backCircleContainer.backgroundColor = .clear
        containerView.insertSubview(backCircleContainer, belowSubview: imageContainer)
        NSLayoutConstraint.activate([
            backCircleContainer.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -22.0),
            backCircleContainer.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            backCircleContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            backCircleContainer.widthAnchor.constraint(equalToConstant: 50.0)
        ])

        backCircleView.translatesAutoresizingMaskIntoConstraints = false
        backCircleView.layer.cornerRadius = 20.0
        backCircleView.alpha = 0.0
        
        backCircleContainer.addSubview(backCircleView)
        NSLayoutConstraint.activate([
            backCircleView.topAnchor.constraint(equalTo: backCircleContainer.bottomAnchor),
            backCircleView.centerXAnchor.constraint(equalTo: backCircleContainer.centerXAnchor),
            backCircleView.widthAnchor.constraint(equalToConstant: 40),
            backCircleView.heightAnchor.constraint(equalToConstant: 40)
        ])

        imageView = UIImageView(image: UIImage(named: item.image))
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        applyTint(color: self.imageTintColor)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 5.0),
            imageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: -5.0),
            imageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 5.0),
            imageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor, constant: -5.0)
        ])
        
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = item.title
        label.font = .systemFont(ofSize: 13)
        label.adjustsFontSizeToFitWidth = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 3.0),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -3.0),
            label.topAnchor.constraint(equalTo: imageContainer.bottomAnchor)
        ])
        
        notificationBubbleContainer.translatesAutoresizingMaskIntoConstraints = false
        notificationBubbleContainer.layer.cornerRadius = 10
        notificationBubbleContainer.backgroundColor = self.notificationBubbleBackgroundClor
        
        imageContainer.addSubview(notificationBubbleContainer)
        NSLayoutConstraint.activate([
            notificationBubbleContainer.heightAnchor.constraint(equalToConstant: 20.0),
            notificationBubbleContainer.widthAnchor.constraint(equalToConstant: 20.0),
            notificationBubbleContainer.topAnchor.constraint(equalTo: imageContainer.topAnchor, constant: 5.0),
            notificationBubbleContainer.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20.0)
        ])
                
        notificationBubbleLabel.textAlignment = .center
        notificationBubbleLabel.textColor = self.notificationTextColor
        notificationBubbleLabel.font = .boldSystemFont(ofSize: 9)
        notificationBubbleLabel.adjustsFontSizeToFitWidth = true
        notificationBubbleLabel.text = item.count
        notificationBubbleLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationBubbleContainer.addSubview(notificationBubbleLabel)
        NSLayoutConstraint.activate([
            notificationBubbleLabel.topAnchor.constraint(equalTo: notificationBubbleContainer.topAnchor, constant: 3.0),
            notificationBubbleLabel.bottomAnchor.constraint(equalTo: notificationBubbleContainer.bottomAnchor, constant: -3.0),
            notificationBubbleLabel.leadingAnchor.constraint(equalTo: notificationBubbleContainer.leadingAnchor, constant: 3.0),
            notificationBubbleLabel.trailingAnchor.constraint(equalTo: notificationBubbleContainer.trailingAnchor, constant: -3.0)
        ])
        
        // hides notification bubble
        if item.notificationCount <= 0 {
            notificationBubbleContainer.isHidden = true
        }
        
        // select default item
        if delegate?.isDefaultItem(itemView: self) == true {
            self.select(animated: false)
        }
    }

    override public var intrinsicContentSize: CGSize {
        CGSize(width: 50.0, height: 70.0)
    }
    
    // Change the rendering mode of the image to 'alwaysTemplate' and
    // set the tint color.
    private func applyTint(color: UIColor?) {
        if let color = color, item != nil {
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
            self.imageView.tintColor = color
        }
    }
    
    private func setSelectedImage() {
        if let selectedImage = self.item.selectedImage {
            self.imageView.image = UIImage(named: selectedImage)
            applyTint(color: self.selectedImageTintColor)
        }
    }
    
    private func setUnSelectedImage() {
        self.imageView.image = UIImage(named: item.image)
        applyTint(color: self.imageTintColor)
    }
    
    // Adds the tap gesture the view.
    private func addTapGesture(view: UIView) {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Animates the container up with given duration.
    private func animateContainerUp(duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            var t = CGAffineTransform.identity
            t = t.translatedBy(x: 0.0, y: -20.0)
            t = t.scaledBy(x: 1.2, y: 1.2)
            self.imageContainer.transform = t
            
            t = CGAffineTransform.identity
            t = t.translatedBy(x: 0.0, y: -78.0)
            t = t.scaledBy(x: 1.2, y: 1.2)
            self.backCircleView.transform = t
            self.backCircleView.alpha = 1.0
        }) { (_) in
            self.delegate?.didAnimate(itemView: self)
            self.setSelectedImage()

        }
    }
    
    // Animates the container down with the given duration.
    private func animateContainerBack(duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            self.imageContainer.transform = .identity
            self.backCircleView.transform = .identity
            self.backCircleView.alpha = 0.0
            self.setUnSelectedImage()
        }, completion: nil)
    }
    
    // Handles the tap gesture on the view.
    @objc private func handleTap() {
        // if no delegate is present, select by default
        guard let delegate = self.delegate else {
            animateContainerUp(duration: circleAnimationDuration)
            return
        }
        
        // else ask the delegate
        if delegate.shouldTap(itemView: self) {
            if delegate.shouldHighlight(itemView: self) {
                if delegate.shouldAnimate(itemView: self) {
                    animateContainerUp(duration: circleAnimationDuration)
                }
                else {
                    animateContainerUp(duration: 0.0)
                }
            }
            delegate.didTap(itemView: self)
        }
    }
    
    // Unselects (animates down) the view. If animated is true
    // animation is performed.
    func unSelect(animated: Bool = true) {
        if animated == false {
            animateContainerBack(duration: 0.0)
        }
        else {
            animateContainerBack(duration: circleAnimationDuration)
        }
    }
    
    // Selects (animates up) the view. If animated is true
    // animation is performed.
    func select(animated: Bool = true) {
        if animated == false {
            animateContainerUp(duration: 0.0)
        }
        else {
            animateContainerUp(duration: circleAnimationDuration)
        }
    }
    
    // Allows to set the circle up/down animation duration.
    func circleAnimationDuration(duration: Double) {
        circleAnimationDuration = duration
    }
    
    // Allows to set the shadow peroperties. Bydefault shadow
    // is off.
    func shadow(opacity: Double = 0.0, radius: Double = 0.0, offset: CGSize = .zero, color: UIColor = .clear) {
        backCircleView.layer.shadowRadius = CGFloat(radius)
        backCircleView.layer.shadowOffset = offset
        backCircleView.layer.shadowColor = color.cgColor
        backCircleView.layer.shadowOpacity = Float(opacity)
    }
}
