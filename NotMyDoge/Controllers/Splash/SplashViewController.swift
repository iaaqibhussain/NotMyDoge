//
//  SplashViewController.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 30/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    //MARK: - Var
    
    var loginViewController: LoginViewController!
    
    
    //MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLoginViewController()
        //Do Controller transition after 0.6 seconds.
        perform(#selector(loadController), with: nil, afterDelay: 0.6)
    }
    
    //MARK: - Functions
    
    //Load Login and Make it root
    private func loadLoginViewController() {
        
        loginViewController = LoginViewController.instantiateViewController()
        UIApplication.shared.delegate?.window??.rootViewController = loginViewController
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
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
