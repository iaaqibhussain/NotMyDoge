//
//  APIManager.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import Alamofire


class APIManager: NSObject {
    /**
     A general purpose networking class for any type of request.
     **/
    func request(urlRequest: URLRequestConvertible, success:@escaping (_ response: Any)->(), failure:@escaping (_ error: Error)->()) {
        Alamofire.request(urlRequest).responseJSON { (response) in
            
            switch response.result {
            case .failure(let error):
                failure(error)
            case .success(let value):
                success(value)
            }
        }
    }
}

