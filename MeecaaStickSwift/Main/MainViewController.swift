//
//  MainViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/19.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    let leftMenuView:UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupMenuView()
    }
    
    func setupMenuView() {
        
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
