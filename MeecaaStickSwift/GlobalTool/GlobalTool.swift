//
//  GlobalTool.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/2/1.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class GlobalTool: UIViewController {
    static let GlobalToolObj:GlobalTool = GlobalTool()
    
    /*手机的UUID*/
    var PhoneUUID:String {
        get{
            return (UIDevice.currentDevice().identifierForVendor?.UUIDString)!
        }
    }
    
    /*手机的DeviceToken*/
    var DeviceToken:String {
        get{
            return ""
        }
    }
    
    /*手机的DeviceSystemVersion*/
    var DeviceSystemVersion:String {
        get{
            return UIDevice.currentDevice().systemVersion
        }
    }
    
    /*成员的存储地址*/
    var MemberArchivePath:String {
        get{
            let docPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last
            let path = docPath?.stringByAppendingString("/member.archive")
            return path!
        }
    }
    
    static func shared()->(GlobalTool) {
        return GlobalToolObj
    }
    
    func showHud(labelText:String, mode:MBProgressHUDMode)->() {
        let hud = MBProgressHUD(view: UIApplication.sharedApplication().keyWindow?.rootViewController!.view)
        UIApplication.sharedApplication().keyWindow?.rootViewController!.view.addSubview(hud)
        hud.labelText = labelText
        hud.mode = mode
        hud.showAnimated(true) { () -> Void in
            sleep(2)
        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}