//
//  FileRouter.swift
//  NotMyDogeTests
//
//  Created by Aaqib Hussain on 1/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
@testable import NotMyDoge
enum FileRouter: Router {
    
    case success
    case failure
    
}

extension FileRouter {
    
    func asURLRequest() throws -> URLRequest {
        switch self {
        case .success:
            let path = Bundle.main.path(forResource: "doge", ofType: "json")
            let fileURL = URL(fileURLWithPath: path!)
            let url = URLRequest(url: fileURL)
            return url
            
        case .failure:
            let path = Bundle.main.path(forResource: "dogecorrupt", ofType: "json")
            let fileURL = URL(fileURLWithPath: path!)
            let url = URLRequest(url: fileURL)
            return url
        }
        
    }
}
