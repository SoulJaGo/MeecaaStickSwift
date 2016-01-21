//
//  ProblemViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/21.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController,UITextViewDelegate {
    var placeholderLabel = UILabel()
    
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
