//
//  RightMenuViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit
import SwiftyJSON
protocol RightMenuDelegate:NSObjectProtocol {
    func onClickRightCell(tableView:UITableView, indexPath:NSIndexPath)
}

class RightMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    internal var delegate:RightMenuDelegate?
    var tableView = UITableView() //菜单tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: CGRectMake(0, 0, 160, UIScreen.mainScreen().bounds.height), style: .Plain)
        self.view.frame = self.tableView.frame
        self.tableView.backgroundColor = MENU_BACKGROUND_COLOR
        
        
        self.tableView.separatorStyle = .None
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        
        let headerView = UIView(frame: CGRectMake(0,0,kScreen_Width,160))
        let headerImageView = UIImageView(frame: CGRectMake(0, 40, 160, 60))
        headerImageView.image = UIImage(named: "left_menu_icon")
        headerView.addSubview(headerImageView)
        self.tableView.tableHeaderView = headerView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID:String = "LeftMenuCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if (cell == nil) {
        cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        
        let titleArray = ["我的信息","家庭成员","问题反馈","我的消息"]
        let imageArray = ["guanyumikai","set_about_icon","tiwenxiaochangshi","synchro"]
        cell?.textLabel!.text = titleArray[indexPath.row]
        cell?.textLabel?.textColor = MENU_TEXT_COLOR
        cell?.backgroundColor = MENU_BACKGROUND_COLOR
        cell?.imageView?.image = UIImage(named: imageArray[indexPath.row])
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if ((self.delegate?.respondsToSelector(Selector("onClickRightCell:"))) != nil) {
            self.delegate?.onClickRightCell(tableView, indexPath: indexPath)
        }
    }

}
