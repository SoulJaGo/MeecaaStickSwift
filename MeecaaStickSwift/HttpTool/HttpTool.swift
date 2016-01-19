//
//  HttpTool.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/19.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpTool: UIViewController {
    static let sharedObj:HttpTool = HttpTool() //单例对象
    
    /*单例模式*/
    static func shared()->HttpTool {
        return sharedObj
    }
    
    /*获取广告页信息*/
    func getAdDict() {
        let urlString = HOST.stringByAppendingString("api.php?m=open&c=ads&a=spread&identifier=")
        Alamofire.request(.GET, urlString).responseJSON { (responseData) -> Void in
            if (responseData.result.isFailure == true) {
                print("网络不给力哦!")
            } else {
                let json = responseData.result.value
                NSUserDefaults.standardUserDefaults().setValue(json, forKey: "ad")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
}
