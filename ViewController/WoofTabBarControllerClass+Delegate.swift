//
//  WoofTabBarControllerClass+Delegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

public protocol WoofTabBarControllerDelegate: UIViewController {
    func shouldSelect() -> Bool
    
    func shouldHighlight() -> Bool
    
    func shouldAnimate() -> Bool
    
    func didSelect()
    
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
