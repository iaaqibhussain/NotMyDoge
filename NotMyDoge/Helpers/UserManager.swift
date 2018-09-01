//
//  UserManager.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    
    //MARK: Vars
    
    static let shared = UserManager()
    private let userDefaults = UserDefaults.standard
    var isUserLoggedIn: Bool {
        return getLoggedInUser() != nil
    }
    
    //MARK: Initializer
    
    private override init() { }
    
    //MARK: Functions
    
    func setUser(user: User) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: user)
        userDefaults.set(encodedData, forKey: User.className)
    }
    
    func getLoggedInUser() -> User? {
        guard let data = userDefaults.value(forKey: User.className) as? Data else { return nil }
        let loggedInUser = NSKeyedUnarchiver.unarchiveObject(with: data) as? User
        return loggedInUser
    }
    
    func deleteUser() {
        userDefaults.removeObject(forKey: User.className)
    }
    
}

