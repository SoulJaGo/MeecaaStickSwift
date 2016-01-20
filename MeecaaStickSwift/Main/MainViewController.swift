//
//  MainViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//  主视图

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /*主页面*/
        let mainController = MainTabBarController()
        self.addChildViewController(mainController)
        self.view.addSubview(mainController.view)
        
        /*左侧菜单*/
        let leftMenuVc = LeftMenuViewController()
        self.addChildViewController(leftMenuVc)
        self.view.insertSubview(leftMenuVc.view, belowSubview: mainController.view)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
