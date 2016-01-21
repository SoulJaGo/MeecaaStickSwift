//
//  HomeViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var iconView = UIImageView()
    var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        /*设置Nav*/
        self.setupNav()
        
        /*设置TabBar*/
        self.setupTabBar()
        
        let rightSwipeMenu = UISwipeGestureRecognizer(target: self, action: Selector("handleRightSwipe:"))
        rightSwipeMenu.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipeMenu)
        
        let leftSwipeMenu = UISwipeGestureRecognizer(target: self, action: Selector("handleLeftSwipe:"))
        leftSwipeMenu.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipeMenu)
    }
    
    /*设置TabBar*/
    func setupTabBar() {
        self.navigationController?.tabBarItem = UITabBarItem(title: "首页", image: UIImage(named: "shouye")?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named:"shouyexuanzhong")?.imageWithRenderingMode(.AlwaysOriginal))
    }
    
    /*设置Nav*/
    func setupNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "左菜单", style: UIBarButtonItemStyle.Done, target: self, action: Selector("switchLeftMenu"))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "右菜单", style: UIBarButtonItemStyle.Done, target: self, action: Selector("switchRightMenu"))
        
        let topView = UIView(frame: CGRectMake(0,0,113,44))
        let deviceLabel = UILabel(frame: CGRectMake(0,0,100,44))
        deviceLabel.text = "请选择设备"
        deviceLabel.textAlignment = .Right
        deviceLabel.textColor = UIColor.whiteColor()
        topView.addSubview(deviceLabel)
        self.titleLabel = deviceLabel
        
        let iconImageView = UIImageView(frame: CGRectMake(102,16,11,11))
        iconImageView.image = UIImage(named: "jiantou")
        topView.addSubview(iconImageView)
        self.iconView = iconImageView
        
        self.navigationItem.titleView = topView
        
        let recognizer = UITapGestureRecognizer(target: self, action: Selector("tapTopView"))
        topView.addGestureRecognizer(recognizer)
    }
    
    func tapTopView() {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.iconView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        }
    }
    
    /*切换左侧菜单*/
    func switchLeftMenu() {
        UIView.animateWithDuration(0.5) { () -> Void in
            let mainTabBarController = self.tabBarController as! MainTabBarController
            
            if (mainTabBarController.view.frame.origin.x == 160) {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            } else {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(160, 0)
            }
        }
    }
    
    /*切换右侧菜单*/
    func switchRightMenu() {
        UIView.animateWithDuration(0.5) { () -> Void in
            let mainTabBarController = self.tabBarController as! MainTabBarController
            
            if (mainTabBarController.view.frame.origin.x == 0) {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(-160, 0)
            } else {
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            }
        }
    }
    
    /*处理右滑手势*/
    func handleRightSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.locationInView(self.view).x > (kScreen_Width / 2)) {
            UIView.animateWithDuration(0.5) { () -> Void in
                let mainTabBarController = self.tabBarController as! MainTabBarController
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            }
        } else {
            UIView.animateWithDuration(0.5) { () -> Void in
                let mainTabBarController = self.tabBarController as! MainTabBarController
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(160, 0)
            }
        }
    }
    
    /*隐藏左侧菜单*/
    func handleLeftSwipe(recognizer: UISwipeGestureRecognizer) {
        if (recognizer.locationInView(self.view).x > (kScreen_Width / 2)) {
            UIView.animateWithDuration(0.5) { () -> Void in
                let mainTabBarController = self.tabBarController as! MainTabBarController
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(-160, 0)
            }
        } else {
            UIView.animateWithDuration(0.5) { () -> Void in
                let mainTabBarController = self.tabBarController as! MainTabBarController
                mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
            }
        }
    }
}
