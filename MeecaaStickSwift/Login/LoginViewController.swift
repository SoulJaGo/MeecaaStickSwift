//
//  LoginViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/26.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginViewController: UIViewController {
    var phoneTextField = UITextField()
    var passwordTextField = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*设置Nav*/
        self.setupNav()
        
        /*设置布局*/
        self.setupView()
    }
    
    func setupNav() {
        self.navigationItem.title = "登陆"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .Done, target: self, action: Selector("goBack"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登陆", style: .Done, target: self, action: Selector("onClickLoginBtn"))
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        /*顶部*/
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "start_logo")
        self.view.addSubview(logoImageView)
        logoImageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(75)
            make.topMargin.equalTo(self.view).offset(10)
        }
        
        /*手机号码View*/
        let phoneView = UIView()
        phoneView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(phoneView)
        phoneView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(kScreen_Width)
            make.height.equalTo(40)
            make.topMargin.equalTo(logoImageView.snp_bottom).offset(20)
            make.left.equalTo(0)
        }
        
        let phoneLogoImageView = UIImageView()
        phoneLogoImageView.image = UIImage(named: "login_mobile_icon")
        phoneView.addSubview(phoneLogoImageView)
        phoneLogoImageView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(32)
            make.height.equalTo(40)
            make.left.equalTo(10)
            make.top.equalTo(0)
        }
        
        phoneTextField = UITextField()
        phoneTextField.borderStyle = UITextBorderStyle.RoundedRect
        phoneTextField.placeholder = "手机号"
        phoneTextField.keyboardType = UIKeyboardType.NumberPad
        phoneView.addSubview(phoneTextField)
        phoneTextField.snp_makeConstraints { (make) -> Void in
            make.leftMargin.equalTo(phoneLogoImageView.snp_right).offset(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
            make.top.equalTo(0)
        }
        
        /*密码View*/
        let passwordView = UIView()
        passwordView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(passwordView)
        passwordView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(kScreen_Width)
            make.height.equalTo(40)
            make.left.equalTo(0)
            make.topMargin.equalTo(phoneView.snp_bottom).offset(15)
        }
        
        let passwordLogoImageView = UIImageView()
        passwordLogoImageView.image = UIImage(named: "login_pwd_icon")
        passwordView.addSubview(passwordLogoImageView)
        passwordLogoImageView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(32)
            make.height.equalTo(40)
            make.left.equalTo(10)
            make.top.equalTo(0)
        }
        
        passwordTextField = UITextField()
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.placeholder = "密码"
        passwordTextField.secureTextEntry = true
        passwordView.addSubview(passwordTextField)
        passwordTextField.snp_makeConstraints { (make) -> Void in
            make.leftMargin.equalTo(passwordLogoImageView.snp_right).offset(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
            make.top.equalTo(0)
        }
        
        let walkAroundBtn = UIButton(type: .Custom)
        walkAroundBtn.setTitle("随便逛逛", forState: .Normal)
        walkAroundBtn.setTitleColor(TEXT_COLOR, forState: .Normal)
        self.view.addSubview(walkAroundBtn)
        walkAroundBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        walkAroundBtn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalTo(self.view)
            make.topMargin.equalTo(passwordView.snp_bottom).offset(10)
        }
        walkAroundBtn.addTarget(self, action: Selector("onClickWalkAroundBtn"), forControlEvents: .TouchUpInside)
        
        let forgetPwdBtn = UIButton(type: .Custom)
        forgetPwdBtn.setTitle("忘记密码", forState: .Normal)
        forgetPwdBtn.setTitleColor(TEXT_COLOR, forState: .Normal)
        forgetPwdBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        self.view.addSubview(forgetPwdBtn)
        forgetPwdBtn.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.rightMargin.equalTo(self.view).offset(-20)
            make.topMargin.equalTo(passwordView.snp_bottom).offset(10)
        }
    }
    
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func onClickWalkAroundBtn() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func onClickLoginBtn() {
        self.view.endEditing(true)
        if (phoneTextField.text == "") { //手机号码输入为空
            GlobalTool.shared().showHud("请输入手机号码!", mode: MBProgressHUDMode.Text)
        } else if (passwordTextField.text == "") {
            GlobalTool.shared().showHud("请输入密码!", mode: MBProgressHUDMode.Text)
        } else if (phoneTextField.text?.characters.count < 11) {
            GlobalTool.shared().showHud("请输入正确的手机号码!", mode: MBProgressHUDMode.Text)
        } else {
            HttpTool.shared().loginWithPhoneNumberAndPassword(self.phoneTextField.text!, password: self.passwordTextField.text!, completionHandler: { (responseData) -> Void in
                if (responseData.result.isFailure) {
                    GlobalTool.shared().showHud("网络不给力哦!", mode: MBProgressHUDMode.Text)
                } else {
                    let json = JSON(responseData.result.value!)
                    let status = json["status"].intValue
                    if (status == 0) { //登陆不成功
                        let msg = json["msg"].stringValue as String
                        GlobalTool.shared().showHud(msg, mode: .Text)
                    } else { //登陆成功
                        var accountDict:Dictionary<String,AnyObject> = [:]
                        accountDict["phone"] = self.phoneTextField.text!
                        accountDict["password"] = self.passwordTextField.text!
                        let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
                        let archivePath = docPath?.stringByAppendingString("/account.archive")
                        NSKeyedArchiver.archiveRootObject(accountDict, toFile: archivePath!)
                        let data = json["data"].rawValue
                        let dataArchivePath = docPath?.stringByAppendingString("/member.archive")
                        NSKeyedArchiver.archiveRootObject(data, toFile: dataArchivePath!)
                        GlobalTool.shared().showHud("登陆成功!", mode: .Text)
                        self.navigationController?.popViewControllerAnimated(true)
                    }
                }
            })
        }
    }
}
