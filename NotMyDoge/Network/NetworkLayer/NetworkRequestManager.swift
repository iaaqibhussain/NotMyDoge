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
    
    //MARK: - Var
    
    private let apiManager: APIManager
    
    //MARK: - Init
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    //MARK: - Function
    
    /**
     Generics are used to make the code "Generic". All you need to do is specify the correct
     model in your view model. It can save you many lines of parsing code in every view model.
     Changing the APIManager class will have zero effect on this class until or unless the
     entire function is changed. It basically parses the response given to it by the APIManager.
     Irrespective of how the APIManager is fetching the data.
     **/
    
    func request<T: Model>(router: Router, success:@escaping (_ response: T)->(), failure:@escaping (_ error: Error)->()) {
        apiManager.request(urlRequest: router, success: { (value) in
            guard let model = Mapper<T>().map(JSONObject: value) else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to Parse into your model"])
                return failure(error)
            }
            success(model)
        }, failure: failure)
    }
}
