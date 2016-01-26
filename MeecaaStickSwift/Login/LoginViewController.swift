//
//  LoginViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/26.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
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
        
        let phoneTextField = UITextField()
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
        
        let passwordTextField = UITextField()
        passwordTextField.borderStyle = UITextBorderStyle.RoundedRect
        passwordTextField.placeholder = "密码"
        passwordView.addSubview(passwordTextField)
        passwordTextField.snp_makeConstraints { (make) -> Void in
            make.leftMargin.equalTo(passwordLogoImageView.snp_right).offset(10)
            make.rightMargin.equalTo(-10)
            make.height.equalTo(40)
            make.top.equalTo(0)
        }
    }
    
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
