//
//  LoginViewModel.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 31/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {

    //MARK: - Vars
    
    private let userManager: UserManager
    //Callback to update UI
    var loginSuccess: ()->()
    
    //MARK: - Initialzier
    
    init(userManager: UserManager = UserManager.shared) {
       self.userManager = userManager
        loginSuccess = {}
    }
    
    //MARK: Function
    
    //Login User
    func login(userName: String, password: String) {
        let user = User(userName: userName, password: password)
        userManager.setUser(user: user)
        loginSuccess()
    }
}
