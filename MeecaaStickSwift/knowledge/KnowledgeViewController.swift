//
//  KnowledgeViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/21.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class KnowledgeViewController: UIViewController,UIWebViewDelegate {
    var webView = UIWebView()
    var HUD:MBProgressHUD = MBProgressHUD()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*设置Nav*/
        self.setupNav()
        
        /*设置View*/
        self.setupView()
    }
    
    func setupNav() {
        self.navigationItem.title = "体温小常识"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .Done, target: self, action: Selector("goBack"))
    }
    
    func setupView() {
        self.webView = UIWebView(frame: self.view.bounds)
        let urlStr = NSBundle.mainBundle().pathForResource("knowledge", ofType: "html")
        let url = NSURL(fileURLWithPath: urlStr!)
        let request = NSURLRequest(URL: url)
        self.webView.loadRequest(request)
        self.webView.delegate = self
        self.view.addSubview(self.webView)
    }
    
    /*返回*/
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.HUD = MBProgressHUD(view: self.navigationController?.view)
        self.navigationController?.view.addSubview(self.HUD)
        self.HUD.labelText = "Loading"
        self.HUD.show(true)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.HUD.hide(true)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.HUD.labelText = "加载失败..."
        self.HUD.showAnimated(true) { () -> Void in
            sleep(2)
        }
    }
}
