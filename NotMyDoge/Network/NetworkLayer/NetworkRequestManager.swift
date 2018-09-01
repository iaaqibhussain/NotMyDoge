//
//  NetworkRequestManager.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import ObjectMapper


class NetworkRequestManager: NSObject {

    private let apiManager: APIManager
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    /**
     Generics are used to make the code "Generic". All you need to do is specify the correct
     model in your view model. It can save you many lines of parsing code in every view model.
     Changing the APIManager class will have zero effect on this class until or unless the
     entire function is changed. It basically parses the response given to it by the APIManager.
     Irrespective of how the APIManager is fetching the data.
     **/
    
    func request<T: Mappable>(urlRequest: Router, success:@escaping (_ response: T)->(), failure:@escaping (_ error: Error)->()) {
        apiManager.request(urlRequest: urlRequest, success: { (value) in
            guard let model = Mapper<T>().map(JSONObject: value) else { return }
            success(model)
        }, failure: failure)
    }
}
