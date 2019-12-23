//
//  WoofTabItem.swift
//  WoofTabBarController
//
//  Created by Faizan Naseem on 22/11/2019.
//  Copyright © 2019 Arpatech Pvt. Ltd. All rights reserved.
//

import UIKit

public class WoofTabBarItem {
    var title: String
    var image: String
    var selectedImage: String?
    var notificationCount = 0
    
    var count: String? {
        return String(notificationCount)
    }
    
    public init(title: String, image: String, selectedImage: String? = nil, notificationCount: Int = 0) {
        self.title = title
        self.image = image
        self.selectedImage = selectedImage
        self.notificationCount = notificationCount
    }
}
