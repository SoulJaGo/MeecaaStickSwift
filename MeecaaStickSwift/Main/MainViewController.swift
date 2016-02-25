//
//  MainViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//  主视图

import UIKit
import SwiftyJSON

class MainViewController: UIViewController,LeftMenuViewDelegate,RightMenuDelegate {
    var mainTabBarController = MainTabBarController()
    override class func initialize () {
        super.initialize()
        /*验证登陆*/
        self.init().performSelector(Selector("validLogin"), withObject: nil)
    }
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
        rightMenuVc.delegate = self
        
        /*添加通知*/
        self.addNotification()
    }
    
    func addNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("validLoginError"), name: "ValidLoginErrorNotification", object: nil)
    }
    
    func validLoginError() {
        let homeNav = self.mainTabBarController.viewControllers![0] as! BasicNavigationController
        
        let loginVc = LoginViewController()
        loginVc.hidesBottomBarWhenPushed = true
        homeNav.pushViewController(loginVc, animated: true)
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
    
    func onClickRightCell(tableView: UITableView, indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.mainTabBarController.view.transform = CGAffineTransformMakeTranslation(0, 0)
        }
        let homeNav = self.mainTabBarController.viewControllers![0] as! BasicNavigationController
        
        if (indexPath.row == 0) {
            let loginVc = LoginViewController()
            loginVc.hidesBottomBarWhenPushed = true
            homeNav.pushViewController(loginVc, animated: true)
        } else if (indexPath.row == 2) {
            let ProblemVc = ProblemViewController()
            ProblemVc.hidesBottomBarWhenPushed = true
            homeNav.pushViewController(ProblemVc, animated: true)
        }
    }
    
    func validLogin() {
        if (NSFileManager.defaultManager().fileExistsAtPath(GlobalTool.shared().AccountArchivePath)) { //验证是否有登陆过
            let account:Account = NSKeyedUnarchiver.unarchiveObjectWithFile(GlobalTool.shared().AccountArchivePath)! as! Account
            HttpTool.shared().loginWithPhoneNumberAndPassword(account.phone, password: account.password, completionHandler: { (responseData) -> Void in
                if (responseData.result.isFailure) {
                    GlobalTool.shared().showHud("网络不给力哦!", mode: .Text)
                } else {
                    let json = responseData.result.value
                    let status = JSON(json!)["status"].int!
                    if (status != 1) {
                        NSNotificationCenter.defaultCenter().postNotificationName("ValidLoginErrorNotification", object: nil)
                        GlobalTool.shared().showHud("验证失败，请重新登陆", mode: .Text)
                    }
                }
            })
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
