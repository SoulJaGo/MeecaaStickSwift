//
//  AboutUsViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        /*设置Nav*/
        self.setupNav()
        
        /*创建视图*/
        self.setupView()
        
    }
    
    /*设置Nav*/
    func setupNav() {
        self.navigationItem.title = "关于米开"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .Done, target: self, action: Selector("goBack"))
    }
    
    /*创建视图*/
    func setupView() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        //logo
        let logoImageView:UIImageView = UIImageView()
        logoImageView.image = UIImage(named: "about_us_icon")
        self.view.addSubview(logoImageView)
        logoImageView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(200)
            make.height.equalTo(65)
            make.centerX.equalTo(self.view)
            make.topMargin.equalTo(self.view).offset(30)
        }
        
        //version
        let versionLabel:UILabel = UILabel()
        versionLabel.text = VERSION
        versionLabel.textAlignment = .Center
        versionLabel.textColor = TEXT_COLOR
        self.view.addSubview(versionLabel)
        versionLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalTo(self.view)
            make.topMargin.equalTo(logoImageView.snp_bottom).offset(10)
        }
        
        //描述
        let descLabel = UILabel()
        descLabel.text = "我们来自上海米开医疗科技有限公司，我们是一群怀抱梦想、勇往直前的人，我们崇尚小而美，极致而不凡的产品。\n\n我们专注于医疗穿戴设备与移动互联的结合，致力于打造家庭健康服务平台。\n\n我们将从颠覆传统体温检测开始，为大家带来更健康、便捷的生活！"
        descLabel.numberOfLines = 0
        descLabel.textColor = TEXT_COLOR
        self.view.addSubview(descLabel)
        descLabel.snp_makeConstraints { (make) -> Void in
            make.leftMargin.equalTo(self.view.snp_left).offset(20)
            make.rightMargin.equalTo(self.view.snp_right).offset(-20)
            make.topMargin.equalTo(versionLabel.snp_bottom).offset(15)
            make.height.equalTo(250)
        }
        
        //联系方式
        let contactLabel = UILabel()
        contactLabel.text = "服务热线: 40009-365-12"
        contactLabel.textColor = TEXT_COLOR
        self.view.addSubview(contactLabel)
        contactLabel.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(30)
            make.width.equalTo(200)
            make.topMargin.equalTo(descLabel.snp_bottom).offset(30)
            make.centerX.equalTo(self.view)
        }
    }
    
    /*返回*/
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
