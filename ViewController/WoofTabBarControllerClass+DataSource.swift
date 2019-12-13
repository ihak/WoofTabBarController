//
//  WoofTabBarControllerClass+DataSource.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

public protocol WoofTabBarControllerDataSource: UIViewController {
    // Retrieves WoofTabBarItem object to draw the item view
    func woofTabBarItem() -> WoofTabBarItem
    
    // If true, previous VC is not removed before adding
    // this VC.
    var addsAsAnOverlay: Bool { get }
    
}

// Default implementation to mark protocol methods optional
public extension WoofTabBarControllerDataSource {
    var addsAsAnOverlay: Bool {
        return false
    }
}
