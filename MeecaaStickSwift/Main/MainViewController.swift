//
//  MainViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//  主视图

import UIKit

class MainViewController: UIViewController,LeftMenuViewDelegate {
    var mainTabBarController = MainTabBarController()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*主页面*/
        let mainController = MainTabBarController()
        self.addChildViewController(mainController)
        self.view.addSubview(mainController.view)
        self.mainTabBarController = mainController
        
        /*左侧菜单*/
        let leftMenuVc = LeftMenuViewController()
        self.addChildViewController(leftMenuVc)
        self.view.insertSubview(leftMenuVc.view, belowSubview: mainController.view)
        leftMenuVc.delegate = self
        
        /*右侧菜单*/
        let rightMenuVc = RightMenuViewController()
        self.addChildViewController(rightMenuVc)
        rightMenuVc.view.frame = CGRectMake(kScreen_Width - 160, 0, 160, kScreen_Height)
        self.view.insertSubview(rightMenuVc.view, belowSubview: mainController.view)
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func onClickCell(tableView: UITableView, indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
        }
        let homeNav = self.mainTabBarController.viewControllers![0] as! BasicNavigationController
        if(indexPath.row == 0) {
            let aboutUsVc = AboutUsViewController()
            aboutUsVc.hidesBottomBarWhenPushed = true
            homeNav.pushViewController(aboutUsVc, animated: true)
        } else if (indexPath.row == 1) {
            let knowledgeVc = KnowledgeViewController()
            knowledgeVc.hidesBottomBarWhenPushed = true
            homeNav.pushViewController(knowledgeVc, animated: true)
        } else if (indexPath.row == 2) {
            let url = NSURL(string: "prefs:root=prefs:root=NOTIFICATIONS_ID")
            if (UIApplication.sharedApplication().canOpenURL(url!) == true) {
                UIApplication.sharedApplication().openURL(url!)
            }
        }
    }
}
