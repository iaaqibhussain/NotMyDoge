//
//  NSObject+ClassName.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 31/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
}
