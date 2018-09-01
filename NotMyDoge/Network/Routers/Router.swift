//
//  Router.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import Alamofire

protocol Router: URLRequestConvertible  {
    func asURLRequest() throws -> URLRequest
}

extension Router {
    var baseURL: String {
        return "https://dog.ceo"
    }
    
}
