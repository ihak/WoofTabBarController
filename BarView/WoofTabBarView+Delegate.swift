//
//  WoofTabBarView+WoofTabBarViewDelegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

protocol WoofTabBarViewDelegate {
    /**
     Called when an item is tapped. If returned true, other methods like should animate,
     shouldHighlight, etc. are called. If returned false the action is cancelled and
     no other messages are forwarded to the view/viewcontroller.
     
     Note: A non required method. Default implementation returns true.
     
     - Parameter itemView: WoofTabBarItemView, the view that should be selected.
     - Parameter atIndex: Int, Index of the item.
     - Returns: Bool, true if the view should be selected or false if not.
     */
    func shouldSelectItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool
    
    /**
     Called before the view selection animation. If returned false, view will be selected
     but no animation is performed which may cause a jurk effect if the view is visible.
    
     Note: A non required method. Default implementation returns true.
     
     - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter atIndex: Int, Index of the item.
     - Returns: Bool, false if the view should not be animated.
     */
    func shouldAnimateItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool
    
    /**
     Called before the animation. Highlighting state is the one when view is
     selected and circulat view is moved up and bezier curve is moved at the
     selected item.
     If you want your view to be selected but don't want to perform any visual
     alert in the bar view return false in this method.
     
     Note: A non required method. Default implementation returns true.
     
     - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter atIndex: Int, Index of the item.
     - Returns: Bool, false if the view should not be highlighted.
     */
    func shouldHighlightItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool
    
    /**
     Called when the view is selected.
     
     - Parameter itemView: WoofTabBarItemView, the selected view.
     - Parameter atIndex: Int, Index of the item.
     */
    func didSelectItem(itemView: WoofTabBarItemView, atIndex: Int)
    
    /**
    Called when the animation finished.
    
    - Parameter itemView: WoofTabBarItemView, the selected view.
    - Parameter atIndex: Int, Index of the item.
    */
    func didAnimateItem(itemView: WoofTabBarItemView, atIndex: Int)
}

extension WoofTabBarViewDelegate {
    func shouldSelectItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool { true }
    
    func shouldHighlightItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool { true }
    
    func shouldAnimateItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool { true }
    
    func didSelectItem(itemView: WoofTabBarItemView, atIndex: Int) {}
    
    func didAnimateItem(itemView: WoofTabBarItemView, atIndex: Int) {}
}
