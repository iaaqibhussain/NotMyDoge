//
//  MyDogeViewModel.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class MyDogeViewModel: NSObject {
    
    //MARK: - Vars
    
    private let manager: NetworkRequestManager
    //Callbacks to update UI
    var loader: (_ status: Bool) -> ()
    var showMessage: (_ message: String) -> ()
    var showData: (_ dogeModel: DogeModel) -> ()
    
    //MARK: - Init
    
    init(apiManager: NetworkRequestManager = NetworkRequestManager()) {
        self.manager = apiManager
        loader = { _ in }
        showMessage = { _ in }
        showData = { _  in }
    }
    
    //MARK: - Function
    
    func thatsNotMyDoge() {
        loader(true)
        manager.request(urlRequest: DogeFetchRouter.dogeFetch, success: { [weak self] (dogeModel: DogeModel) in
            guard let `self` = self, let status = dogeModel.success else { return }
            
            if status {
                self.showData(dogeModel)
            } else {
                self.loader(false)
            }
        }) { [weak self] (error) in
            guard let `self` = self else { return }
            self.loader(false)
            self.showMessage(error.localizedDescription)
        }
    }
    
    func logout() {
      UserManager.shared.deleteUser()
    }

}
