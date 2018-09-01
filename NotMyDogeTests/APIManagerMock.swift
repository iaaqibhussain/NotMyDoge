//
//  NetworkRequestManagerMock.swift
//  NotMyDogeTests
//
//  Created by Aaqib Hussain on 1/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
@testable import NotMyDoge

//class NetworkRequestManagerMock: NetworkRequestManager {
//
//    private let apiManager: APIManager
//    
//    override init(apiManager: APIManager) {
//        self.apiManager = apiManager
//    }
//    
//    override func request<T>(urlRequest: Router, success: @escaping (T) -> (), failure: @escaping (Error) -> ()) where T : Model {
//
//        apiManager.request(urlRequest: urlRequest, success: { (value) in
//            guard let model = Mapper<T>().map(JSONObject: value) else {
//            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unable to Parse into your model"])
//                return failure(error)
//            }
//            success(model)
//        }, failure: failure)
//    }
//    
//}

class APIManagerMock: APIManager {
    
    override func request(urlRequest: URLRequestConvertible, success: @escaping (Any) -> (), failure: @escaping (Error) -> ()) {
        let randomJson =
                    [
                    "status": "success",
                    "message": "https://images.dog.ceo/breeds/basenji/n02110806_518.jpg"
                    ]
        success(randomJson)
    }
}
