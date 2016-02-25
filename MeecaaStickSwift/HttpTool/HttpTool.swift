//
//  HttpTool.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/19.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit
import Alamofire

typealias responseBlock = (AnyObject)->()

class HttpTool: UIViewController {
    let APPKEY = "!@#$%meecaa.com"
    
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
    
    /*利用电话和密码登陆*/
    func loginWithPhoneNumberAndPassword(phoneNumber:String,password:String, completionHandler:Response<AnyObject, NSError>->Void) {
        var params:Dictionary<String,String> = [:]
        params["phone"] = phoneNumber
        params["password"] = password
        params["devicetype"] = "ios"
        params["timestamp"] = String(NSDate().timeIntervalSince1970)
        params["uuid"] = GlobalTool.shared().PhoneUUID
        params["version"] = VERSION
        params["devicetoken"] = GlobalTool.shared().DeviceToken
        params["sign"] = phoneNumber.stringByAppendingString(password).stringByAppendingString(params["timestamp"]!).stringByAppendingString(APPKEY).md5()
        params["device_brand"] = "apple"
        params["device_model"] = "iPhone 6S Plus"
        params["device_system"] = "ios"
        params["device_version"] = GlobalTool.shared().DeviceSystemVersion
        
        let urlStr = HOST.stringByAppendingString("api.php?m=open&c=account&a=login")
        Alamofire.request(.POST, urlStr, parameters: params).responseJSON(completionHandler: completionHandler)
    }
    
    /*上传问题*/
    func submitProblemWithText(text:String,completionHandler:Response<AnyObject, NSError>->Void) {
        var params:Dictionary<String,AnyObject> = [:]
        params["member_id"] = GlobalTool.shared().DefaultMemberInformation["id"]
        params["messages"] = text
        params["version"] = VERSION
        params["device_brand"] = "apple"
        params["device_model"] = "iPhone 6S Plus"
        params["device_system"] = "ios"
        params["device_version"] = GlobalTool.shared().DeviceSystemVersion
        let urlStr = HOST.stringByAppendingString("api.php?m=open&c=meecaa&a=messageAdd")
        Alamofire.request(.POST, urlStr,parameters:params).responseJSON(completionHandler: completionHandler)
    }
}
