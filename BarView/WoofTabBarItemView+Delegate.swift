//
//  WoofTabBarItemView+Delegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

protocol WoofTabBarItemViewDelegate {
    func isDefaultItem(itemView: WoofTabBarItemView) -> Bool

    func shouldTap(itemView: WoofTabBarItemView) -> Bool
    
    func shouldHighlight(itemView: WoofTabBarItemView) -> Bool
    
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool

    func didTap(itemView: WoofTabBarItemView)
    
    func didAnimate(itemView: WoofTabBarItemView)
}

extension WoofTabBarItemViewDelegate {
    func shouldTap(itemView: WoofTabBarItemView) -> Bool { true }
    
    func shouldHighlight(itemView: WoofTabBarItemView) -> Bool { true }
    
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool { true }

    func didTap(itemView: WoofTabBarItemView) {}
        
    func didAnimate(itemView: WoofTabBarItemView) {}
}
