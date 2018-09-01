//
//  APIManagerMock.swift
//  NotMyDogeTests
//
//  Created by Aaqib Hussain on 1/9/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
@testable import NotMyDoge

class APIManagerMock: APIManager {
    
    override func request(urlRequest: URLRequestConvertible, success: @escaping (Any) -> (), failure: @escaping (Error) -> ()) {
        let json = loadJson(url: urlRequest.urlRequest!.url!) as Any
        success(json)
    }
    
    private func loadJson(url: URL) -> [String : Any]? {
        do {
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String : Any]
            return jsonResult
        } catch {
            // handle error
            print(error.localizedDescription)
            return nil
        }
    }
}
