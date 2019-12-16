//
//  WoofTabBarControllerClass+DataSource.swift
//  WoofTabBarController
//
//  Created by Hassan Ahmed on 13/12/2019.
//

import Foundation

public protocol WoofTabBarControllerDataSource: UIViewController {
    /**
     A required method. Implement this method to return WoofTabBarItem object
     providing name and image.
     
     - Returns: WoofTabBarItem, an object containing image and name
     for the tab bar item view.
     */
    func woofTabBarItem() -> WoofTabBarItem
    
    /**
     Tells the WoofTabBarController if your VC should be added as an overlay.
     If set to true, previous VC is not removed when selected this VC. Hence
     you can set the translucency of the selected view to display the previous
     view in the background.
     
     Note: By default set to false.
     */
    var addsAsAnOverlay: Bool { get }
}

// Default implementation to mark protocol methods optional
public extension WoofTabBarControllerDataSource {
    var addsAsAnOverlay: Bool {
        return false
    }
}
