//
//  WoofTabView.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

public class WoofTabBarView: UIView {

    // Array of items corresponding to each tab.
    var barItems = [WoofTabBarItem]()
    
    var delegate: WoofTabBarViewDelegate?

    // Bezier view (the curve that runs behind).
    private let bezierView = BezierView()
    
    // Stackview contains the item views created.
    private let stackView = UIStackView()
    
    // Default selected index.
    var defaultSelectedIndex = 0
    
    // Background color of the bezier view
    public var bezierBackgroundColor: UIColor = .white
    
    // Background color of the circular view that highlights
    // and animates up upon selection.
    public var circleBackgroundColor: UIColor = .white
    
    // Background color of the notification bubble.
    public var notificationBubbleColor: UIColor = .orange
    
    // Text color of notification label.
    public var notificationTextColor: UIColor = .white
    
    // Image tint color. Image is automatically converted to template
    // rendering mode when tint color is set.
    public var imageTint: UIColor?
    
    // Animation duratin of the bezier along the x axis.
    public var bezieranimationDuration = 0.15
    
    // Animation of the circular view along the y axis.
    public var circleAnimationDuration = 0.2
    
    // Typealiases for shadow properties
    public typealias offset = CGSize
    public typealias radius = Double
    public typealias opacity = Double
    public typealias color = UIColor
    
    // Shadow properties combined in a tuple
    public var shadow: (radius, opacity, offset, color)?
    
    // The item index that is currently selected.
    // An item can be selected but is not highlighted.
    var selectedIndex = -1
    
    // An item can be selected but not highlighted.
    // The item index that is highlighted i.e curve is at
    // that index and circle view is moved up.
    var highlightedIndex = -1 {
        didSet {
            guard oldValue > -1 else {
                return
            }
            
            if oldValue != highlightedIndex {
                unSelectItem(index: oldValue)
            }
        }
    }
    
    // Convenience initializer that takes an array of
    // WoofTabBarItem(s). The no of tabs are derived from
    // this array.
    convenience init(barItems: [WoofTabBarItem]) {
        self.init()
        self.barItems.append(contentsOf: barItems)
    }
    
    override public func layoutSubviews() {
        guard stackView.superview == nil else {
            return
        }
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        for item in barItems {
            let barItemView = WoofTabBarItemView()
            barItemView.circleBackgroundColor = self.circleBackgroundColor
            barItemView.circleAnimationDuration(duration: self.circleAnimationDuration)
            barItemView.item = item
            barItemView.imageTintColor = self.imageTint
            barItemView.delegate = self
            if let shadow = self.shadow {
                barItemView.shadow(opacity: shadow.1, radius: shadow.0, offset: shadow.2, color: shadow.3)
            }
            barItemView.notificationTextColor = self.notificationTextColor
            barItemView.notificationBubbleBackgroundClor = self.notificationBubbleColor
            stackView.addArrangedSubview(barItemView)            
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        bezierView.shapeBackgroundColor(color: bezierBackgroundColor)
        bezierView.animationDuration(duration: bezieranimationDuration)
        if let shadow = self.shadow {
            bezierView.shadow(opacity: shadow.1, radius: shadow.0, offset: shadow.2, color: shadow.3)
        }
        
        bezierView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(bezierView, belowSubview: stackView)
        
        NSLayoutConstraint.activate([
            bezierView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bezierView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bezierView.topAnchor.constraint(equalTo: self.topAnchor),
            bezierView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        bezierView.addShapeLayer()
    }
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: 300.0, height: 60.0)
    }
    
    // Unselects an item at the given index.
    private func unSelectItem(index: Int) {
        if let item = self.stackView.arrangedSubviews[index] as? WoofTabBarItemView {
            item.unSelect()
        }
    }
    
    // Select an item at the given index. If animated is true, animation is performed.
    private func selectItem(index: Int, animated: Bool) {
        if let item = self.stackView.arrangedSubviews[index] as? WoofTabBarItemView {
            item.select(animated: animated)
        }
    }
    
    // Move the curve of the bezier view according to the selected item position.
    private func changeCurveShape(position: CGPoint, animated: Bool = true) {
        bezierView.moveCurve(to: position.x, animated: animated)
    }
    
    // Returns the index of given item view.
    private func indexOfItemView(itemView: WoofTabBarItemView) -> Int? {
        return self.stackView.arrangedSubviews.firstIndex(of: itemView)
    }
}

extension WoofTabBarView: WoofTabBarItemViewDelegate {
    func isDefaultItem(itemView: WoofTabBarItemView) -> Bool {
        if let defaultItem = self.stackView.arrangedSubviews[defaultSelectedIndex] as? WoofTabBarItemView {
            guard defaultItem == itemView else {
                return false
            }
            self.changeCurveShape(position: itemView.center, animated: false)
            self.selectedIndex = defaultSelectedIndex
            self.highlightedIndex = defaultSelectedIndex
            return true
        }
        return false
    }
    
    func shouldHighlight(itemView: WoofTabBarItemView) -> Bool {
        if let index = indexOfItemView(itemView: itemView), let delegate = self.delegate {
            return delegate.shouldHighlightItem(itemView: itemView, atIndex: index)
        }
        return true
    }
    
    func shouldTap(itemView: WoofTabBarItemView) -> Bool {
        if let index = indexOfItemView(itemView: itemView), let delegate = self.delegate {
            return delegate.shouldSelectItem(itemView: itemView, atIndex: index)
        }
        return true
    }
    
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool {
        if let index = indexOfItemView(itemView: itemView), let delegate = self.delegate {
            return delegate.shouldAnimateItem(itemView: itemView, atIndex: index)
        }
        return true
    }
    
    func didTap(itemView: WoofTabBarItemView) {
        if let index = indexOfItemView(itemView: itemView) {
            guard index != selectedIndex else {
                return
            }
            
            // Move the curve if highlight is enabled for current selection
            if self.shouldHighlight(itemView: itemView) {
                self.changeCurveShape(position: itemView.center, animated: self.shouldAnimate(itemView: itemView))
                self.highlightedIndex = index
            }
            
            self.selectedIndex = index
            print("selected index", selectedIndex)
            
            // Inform the delegate about the item selection
            self.delegate?.didSelectItem(itemView: itemView, atIndex: index)
        }
    }
    
    func didAnimate(itemView: WoofTabBarItemView) {
        if let index = indexOfItemView(itemView: itemView) {
            delegate?.didAnimateItem(itemView: itemView, atIndex: index)
        }
    }
}
