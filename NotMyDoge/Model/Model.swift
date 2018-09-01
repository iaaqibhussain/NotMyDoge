//
//  Model.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 1/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import ObjectMapper

protocol Model: Mappable {
    init?(map: ModelMap)
    func mapping(map: ModelMap)
}

extension Model {
    typealias ModelMap = Map
}
