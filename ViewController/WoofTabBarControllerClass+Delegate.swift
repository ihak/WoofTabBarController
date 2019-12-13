//
//  WoofTabBarControllerClass+Delegate.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

public protocol WoofTabBarControllerDelegate: UIViewController {
    func shouldAnimate() -> Bool
    
    func shouldSelect() -> Bool
    
    func didSelect()
    
    func didAnimate()
}

// Default implementation to mark protocol methods optional
public extension WoofTabBarControllerDelegate {
    func shouldAnimate() -> Bool { true }
    
    func shouldSelect() -> Bool { true }
    
    func didSelect() {}
    
    func didAnimate() {}
}
