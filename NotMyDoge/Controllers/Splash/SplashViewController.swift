//
//  SplashViewController.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    var loginViewController: LoginViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load Login and Make it root
        loginViewController = LoginViewController.instantiateViewController()
        UIApplication.shared.delegate?.window??.rootViewController = loginViewController
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
        perform(#selector(loadController), with: nil, afterDelay: 0.6)
    }
    
    @objc func loadController() {
  
        dismiss(animated: false)
        //Decides if User is Loggedin then take to Home.
        if UserManager.shared.isUserLoggedIn {
            let viewController = UITabBarController.instantiateViewController()
            loginViewController.present(viewController, animated: true)
        }
    }
}
