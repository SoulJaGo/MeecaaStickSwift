//
//  HomeViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        /*设置Nav*/
        self.setupNav()
        
        let rightSwipeLeftMenu = UISwipeGestureRecognizer(target: self, action: Selector("showLeftMenu:"))
        rightSwipeLeftMenu.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipeLeftMenu)
        
        let leftSwipeLeftMenu = UISwipeGestureRecognizer(target: self, action: Selector("hideLeftMenu:"))
        leftSwipeLeftMenu.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipeLeftMenu)
    }
    
    func setupNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "左菜单", style: UIBarButtonItemStyle.Done, target: self, action: Selector("switchLeftMenu"))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "右菜单", style: UIBarButtonItemStyle.Done, target: self, action: Selector("showRightMenu"))
    }
    
    /*切换左侧菜单*/
    func switchLeftMenu() {
        UIView.animateWithDuration(0.5) { () -> Void in
            let mainTabBarController = self.tabBarController as! MainTabBarController
            
            if (mainTabBarController.view.frame.origin.x == 200) {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            } else {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(200, 0)
            }
        }
    }
    
    /*展示左侧菜单*/
    func showLeftMenu(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.locationInView(self.view).x > (kScreen_Width / 2)) {
            return;
        } else {
            UIView.animateWithDuration(0.5) { () -> Void in
                let mainTabBarController = self.tabBarController as! MainTabBarController
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(200, 0)
            }
        }
    }
    
    /*隐藏左侧菜单*/
    func hideLeftMenu(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.locationInView(self.view).x > (kScreen_Width / 2)) {
            return;
        } else {
            UIView.animateWithDuration(0.5) { () -> Void in
                let mainTabBarController = self.tabBarController as! MainTabBarController
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            }
        }
    }
    
    func showRightMenu() {
        UIView.animateWithDuration(0.5) { () -> Void in
            let mainTabBarController = self.tabBarController as! MainTabBarController
            
            if (mainTabBarController.view.frame.origin.x == -200) {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            } else {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(-200, 0)
            }
        }
    }
}
