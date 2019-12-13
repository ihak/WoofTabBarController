//
//  WoofTabBarControllerClass+Delegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

public protocol WoofTabBarControllerDelegate: UIViewController {
    func shouldAnimate(item: WoofTabBarItem) -> Bool
    func shouldTap(at item: WoofTabBarItem) -> Bool
    func didTap(at item: WoofTabBarItem)
    func didAnimate(item: WoofTabBarItem)
}

// Default implementation to mark protocol methods optional
public extension WoofTabBarControllerDelegate {
    func shouldAnimate(item: WoofTabBarItem) -> Bool { true }
    
    func shouldTap(at item: WoofTabBarItem) -> Bool { true }
    
    func didTap(at item: WoofTabBarItem) {}
    
    func didAnimate(item: WoofTabBarItem) {}
}
