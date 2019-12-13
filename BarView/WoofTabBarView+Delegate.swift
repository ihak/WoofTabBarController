//
//  WoofTabBarView+WoofTabBarViewDelegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

protocol WoofTabBarViewDelegate {
    func shouldSelectItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool
    
    func shouldAnimateItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool
    
    func didSelectItem(itemView: WoofTabBarItemView, atIndex: Int)
    
    func didAnimateItem(itemView: WoofTabBarItemView, atIndex: Int)
}

extension WoofTabBarViewDelegate {
    func shouldSelectItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool { true }
    
    func shouldAnimateItem(itemView: WoofTabBarItemView, atIndex: Int) -> Bool { true }
    
    func didSelectItem(itemView: WoofTabBarItemView, atIndex: Int) {}
    
    func didAnimateItem(itemView: WoofTabBarItemView, atIndex: Int) {}
}
