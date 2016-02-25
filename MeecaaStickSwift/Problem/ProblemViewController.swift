//
//  ProblemViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/21.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProblemViewController: UIViewController,UITextViewDelegate {
    var placeholderLabel = UILabel()
    var myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*设置Nav*/
        self.setupNav()
        
        /*设置View*/
        self.setupView()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    /*设置View*/
    func setupView() {
        let textView = UITextView()
        textView.frame = CGRectMake(0, 0, kScreen_Width, 300)
        textView.textColor = TEXT_COLOR
        textView.font = UIFont.systemFontOfSize(15)
        textView.delegate = self
        textView.becomeFirstResponder()
        self.view.addSubview(textView)
        self.myTextView = textView
        
        self.placeholderLabel = UILabel(frame: CGRectMake(0,5,180,21))
        self.placeholderLabel.text = "请输入您的问题,谢谢!"
        self.placeholderLabel.textColor = TEXT_COLOR
        textView.addSubview(self.placeholderLabel)
        self.placeholderLabel.hidden = true
    }
    
    /*设置Nav*/
    func setupNav() {
        self.navigationItem.title = "问题反馈"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .Done, target: self, action: Selector("goBack"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .Done, target: self, action: Selector("onClickSubmit"))
    }
    
    /*提交问题*/
    func onClickSubmit() {
        self.view.endEditing(true)
        if (self.myTextView.text.characters.count == 0) {
            GlobalTool.shared().showHud("请填写问题!", mode: .Text)
        } else {
            /*判断是否登陆*/
            if (GlobalTool.shared().MembersInformation.isEmpty ) {
                GlobalTool.shared().showHud("请您先登陆!", mode: .Text)
                self.navigationController?.pushViewController(LoginViewController(), animated: true)
            } else {
                MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                HttpTool.shared().submitProblemWithText(self.myTextView.text, completionHandler: { (responseData) -> Void in
                    MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
                    if (responseData.result.isFailure) {
                        GlobalTool.shared().showHud("网络不给力哦!", mode: MBProgressHUDMode.Text)
                    } else {
                        let json = JSON(responseData.result.value!)
                        let status = json["status"].intValue
                        if (status == 1) {
                            GlobalTool.shared().showHud("提交成功!", mode: MBProgressHUDMode.Text)
                        } else {
                            GlobalTool.shared().showHud("提交失败!", mode: MBProgressHUDMode.Text)
                        }
                    }
                })
            }
        }
    }
    
    /*返回*/
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        self.placeholderLabel.hidden = true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if(textView.text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) != 0) {
            self.placeholderLabel.hidden = true
        } else {
            self.placeholderLabel.hidden = false
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}
