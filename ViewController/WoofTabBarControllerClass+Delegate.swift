//
//  WoofTabBarControllerClass+Delegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

public protocol WoofTabBarControllerDelegate: UIViewController {
    /**
     Called when the item is tapped in the bar. If returned true, other selection
     related methods like shouldHighlight, shouldAnimate, etc are called. If returned false
     action is cancelled.
     
     Note: A non required method. Default implementation returns true.
     
     - Returns: Bool, return false if you don't want to select a particular VC
     */
    func shouldSelect() -> Bool
    
    /**
     Called before the animation. Highlighting state is the one when view is
     selected and circular view is moved up and bezier curve is moved at the
     selected item.
     If you want your view to be selected but don't want to perform any visual
     alert in the bar view return false in this method.
     
     Note: A non required method. Default implementation returns true.
     
     - Returns: Bool, false if the view should not be highlighted.
     */
    func shouldHighlight() -> Bool
    
    /**
      Called before the view selection animation. If returned false, view will be selected
      but no animation is performed which may cause a jurk effect if the view is visible.
     
      Note: A non required method. Default implementation returns true.
      
      - Returns: Bool, false if the view should not be animated.
     */
    func shouldAnimate() -> Bool
    
    /**
     Called when the view is selected.
     */
    func didSelect()
    
    /**
     Called when the animation is finished.
     */
    func didAnimate()
}

// Default implementation to mark protocol methods optional
public extension WoofTabBarControllerDelegate {
    func shouldSelect() -> Bool { true }
    
    func shouldHighlight() -> Bool { true }
    
    func shouldAnimate() -> Bool { true }
    
    func didSelect() {}
    
    func didAnimate() {}
}

public typealias WoofTabControllerItem = WoofTabBarControllerDataSource & WoofTabBarControllerDelegate

public protocol WoofTabBarControllerBarViewDelegate: WoofTabBarController {
    /**
     Called when an item is tapped. If returned true, other methods like should animate,
     shouldHighlight, etc. are called. If returned false the action is cancelled and
     no other messages are forwarded..
     
     Note: A non required method. Default implementation returns true.
     
     - Parameter itemView: WoofTabBarItemView, the view that should be selected.
     - Parameter destinationVC: WoofTabControllerItem, a UIViewController subclass that implements datasource and delegate methods of WoofTabBarController
     - Parameter atIndex: Int, Index of the item.
     - Returns: Bool, true if the view should be selected or false if not.
     */
    func shouldSelectItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) -> Bool
    
    /**
     Called before the view selection animation. If returned false, view will be selected
     but no animation is performed which may cause a jurk effect if the view is visible.
    
     Note: A non required method. Default implementation returns true.
     
     - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter destinationVC: WoofTabControllerItem, a UIViewController subclass that implements datasource and delegate methods of WoofTabBarController
     - Parameter atIndex: Int, Index of the item.
     - Returns: Bool, false if the view should not be animated.
     */
    func shouldAnimateItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) -> Bool
    
    /**
     Called before the animation. Highlighting state is the one when view is
     selected and circular view is moved up and bezier curve is moved at the
     selected item.
     If you want your view to be selected but don't want to perform any visual
     alert in the bar view return false in this method.
     
     Note: A non required method. Default implementation returns true.
     
     - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter destinationVC: WoofTabControllerItem, a UIViewController subclass that implements datasource and delegate methods of WoofTabBarController
     - Parameter atIndex: Int, Index of the item.
     - Returns: Bool, false if the view should not be highlighted.
     */
    func shouldHighlightItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) -> Bool
    
    /**
     Called when the view is selected.
     
     - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter destinationVC: WoofTabControllerItem, a UIViewController subclass that implements datasource and delegate methods of WoofTabBarController
     - Parameter atIndex: Int, Index of the item.
     */
    func didSelectItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int)
    
    /**
    Called when the animation finished.
    
    - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter destinationVC: WoofTabControllerItem, a UIViewController subclass that implements datasource and delegate methods of WoofTabBarController
    - Parameter atIndex: Int, Index of the item.
    */
    func didAnimateItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int)
}

// Default implementation to mark protocol methods optional.
public extension WoofTabBarControllerBarViewDelegate {
    func shouldSelectItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) -> Bool { true }

    func shouldAnimateItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) -> Bool { true }

    func shouldHighlightItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) -> Bool { true }

    func didSelectItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) {}

    func didAnimateItem(itemView: WoofTabBarItemView, destinationVC: WoofTabControllerItem, atIndex: Int) {}
}
