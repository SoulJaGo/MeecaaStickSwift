//
//  BasicNavigationController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/1/20.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class BasicNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(named: "navigationbarColor"), forBarMetrics: .Default)
        self.navigationBar.tintColor = UIColor.whiteColor()
    }
}
