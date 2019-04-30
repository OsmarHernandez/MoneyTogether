//
//  MainTabBarController.swift
//  MoneyTogether
//
//  Created by Osmar Hernández on 29/04/19.
//  Copyright © 2019 pastdue. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupTabBarAttributes()
    }
    
    func setupTabBarAttributes() {
        let attributes = [kCTFontAttributeName: UIFont(name: "FontAwesome5Free-Solid", size: 24.0)]
        
        UITabBarItem.appearance().setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        self.tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
    }
}
