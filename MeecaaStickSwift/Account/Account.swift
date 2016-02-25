//
//  Account.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/2/2.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class Account: NSObject,NSCoding {
    var phone:String!
    var password:String!
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.phone = aDecoder.decodeObjectForKey("phone") as! String
        self.password = aDecoder.decodeObjectForKey("password") as! String
    }
    
    init(phone:String,password:String) {
        super.init()
        self.phone = phone
        self.password = password
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.phone, forKey: "phone")
        aCoder.encodeObject(self.password, forKey: "password")
    }
}
