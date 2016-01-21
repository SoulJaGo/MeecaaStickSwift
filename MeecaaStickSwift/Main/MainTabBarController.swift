//
//  MainTabBarController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor()], forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.redColor()], forState: .Selected)
        
        self.tabBar.backgroundImage = UIImage(named: "navigationbarColor")
        
        let homeVc = HomeViewController()
        let homeNav = BasicNavigationController(rootViewController:homeVc)
        self.viewControllers = [homeNav]
        self.selectedViewController = homeNav
    }
}
