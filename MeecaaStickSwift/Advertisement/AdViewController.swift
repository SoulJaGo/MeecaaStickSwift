//
//  AdViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/19.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit
import SwiftyJSON

class AdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //整体页面的图片
        let imageView = UIImageView(frame: self.view.bounds)
        
        
        //获取广告页数据
        let adJson = NSUserDefaults.standardUserDefaults().objectForKey("ad")
        if (adJson == nil) { /*没有广告页数据的时候*/
            imageView.image = UIImage(named: "placeholder")
            self.performSelector(Selector("JumpToMain"), withObject: nil)
        } else { /*广告页数据存在的时候*/
            let json = JSON(adJson!)
            let status = json["status"].int
            if (status == 0) { /*状态码为0*/
                imageView.image = UIImage(named: "placeholder")
                self.performSelector(Selector("JumpToMain"), withObject: nil)
            } else { /*状态码为1*/
                let imgUrlStr = json["data"]["img"].stringValue
                imageView.sd_setImageWithURL(NSURL(string: imgUrlStr), placeholderImage: UIImage(named: "placeholder"))
                self.performSelector(Selector("JumpToMain"), withObject: nil, afterDelay: 3.0)
            }
        }
        self.view.addSubview(imageView)
        
        //获取广告页信息
        HttpTool.shared().getAdDict()
    }
    
    /*跳转控制器*/
    func JumpToMain() {
       UIApplication.sharedApplication().keyWindow?.rootViewController =  MainViewController()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
