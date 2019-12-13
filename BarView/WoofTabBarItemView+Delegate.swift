//
//  WoofTabBarItemView+Delegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

protocol WoofTabBarItemViewDelegate {
    func isDefaultItem(itemView: WoofTabBarItemView) -> Bool
    
    func didTap(itemView: WoofTabBarItemView)
    
    func shouldTap(itemView: WoofTabBarItemView) -> Bool
    
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool
    
    func didAnimate(itemView: WoofTabBarItemView)
}

extension WoofTabBarItemViewDelegate {
    func didTap(itemView: WoofTabBarItemView) {}
    
    func shouldTap(itemView: WoofTabBarItemView) -> Bool { true }
    
    func shouldAnimate(itemView: WoofTabBarItemView) -> Bool { true }
    
    func didAnimate(itemView: WoofTabBarItemView) {}
}
