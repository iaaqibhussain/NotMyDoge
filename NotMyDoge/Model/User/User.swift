//
//  User.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    
    let userName: String
    let password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.userName = aDecoder.decodeObject(forKey: "userName") as! String
        self.password = aDecoder.decodeObject(forKey: "password") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userName, forKey: "userName")
        aCoder.encode(password, forKey: "password")
    }
    
}
