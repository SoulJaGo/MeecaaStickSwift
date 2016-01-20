//
//  LeftMenuViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView = UITableView() //菜单tableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: CGRectMake(0, 0, 200, UIScreen.mainScreen().bounds.height), style: .Plain)
        self.view.frame = self.tableView.frame
        self.tableView.backgroundColor = MENU_BACKGROUND_COLOR
        
        
        self.tableView.separatorStyle = .None
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(self.tableView)
        
        let headerView = UIView(frame: CGRectMake(0,0,kScreen_Width,160))
        let headerImageView = UIImageView(frame: CGRectMake(20, 40, 160, 60))
        headerImageView.image = UIImage(named: "left_menu_icon")
        headerView.addSubview(headerImageView)
        self.tableView.tableHeaderView = headerView
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID:String = "LeftMenuCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if (cell == nil) {
            cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        }
        
        let titleArray = ["关于米开","体温常识","消息推送"]
        let imageArray = ["guanyumikai","set_about_icon","synchro"]
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
    }
}