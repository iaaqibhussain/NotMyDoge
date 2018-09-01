//
//  NotMyDogeTests.swift
//  NotMyDogeTests
//
//  Created by Aaqib Hussain on 29/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import XCTest
import Alamofire
@testable import NotMyDoge

class NotMyDogeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /**
     API layer gets tested here in the ViewModel
     **/
    
    func testMyDogeViewModelSuccess() {
        
        let manager = NetworkRequestManager(apiManager: APIManagerMock())
        let viewModel = MyDogeViewModel(apiManager: manager)
        viewModel.thatsNotMyDoge(router: FileRouter.success)
        guard let dogeModel = viewModel.dogeModel else { return XCTFail() }
        XCTAssertEqual(dogeModel.breedName, "Basenji")
        XCTAssertEqual(dogeModel.success, true)
        XCTAssertEqual(dogeModel.dogeImageURL, URL(string: "https://images.dog.ceo/breeds/basenji/n02110806_518.jpg"))
        
    }
    
    /**
     Separately testing the layer
     **/
    func testNetworkRequestManager() {
        let manager = NetworkRequestManager(apiManager: APIManagerMock())
        var dogeModel: DogeModel?
        
        manager.request(router: FileRouter.success, success: { (model: DogeModel) in
            dogeModel = model
        }) { (error) in }
        
        XCTAssertEqual(dogeModel?.breedName, "Basenji")
        XCTAssertEqual(dogeModel?.success, true)
        XCTAssertEqual(dogeModel?.dogeImageURL, URL(string: "https://images.dog.ceo/breeds/basenji/n02110806_518.jpg"))
    }
    
    //In case data is corrupted or with false data
    
    func testMyDogeViewModelFailure() {
        
        let manager = NetworkRequestManager(apiManager: APIManagerMock())
        let viewModel = MyDogeViewModel(apiManager: manager)
        viewModel.thatsNotMyDoge(router: FileRouter.failure)
        guard let dogeModel = viewModel.dogeModel else { return XCTFail() }
        XCTAssertEqual(dogeModel.breedName, "NA")
        XCTAssertEqual(dogeModel.success, false)
        XCTAssertEqual(dogeModel.dogeImageURL, nil)
        
    }
    
    
    func testDogeFetchRouter() {
        let router = DogeFetchRouter.dogeFetch
        XCTAssertEqual(router.urlRequest?.url, URL(string: "\(router.baseURL)/api/breeds/image/random"))
    }
}
