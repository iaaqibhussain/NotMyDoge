//
//  DogeFetchRouter.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import Alamofire

enum DogeFetchRouter: Router {
    case dogeFetch
}

extension DogeFetchRouter {
    
    //Create Request to fetch random breed
    func asURLRequest() throws -> URLRequest {
        let result: (path: String, parameters: Parameters) = {
            switch self {
            case .dogeFetch:
                return ("/api/breeds/image/random", [:])
            }
        }()
        let url = try self.baseURL.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        return try URLEncoding.default.encode(urlRequest, with: result.parameters)
    }
}
