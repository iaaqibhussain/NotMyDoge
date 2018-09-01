//
//  LoginViewController.swift
//  NotMyDoge
//
//  Created by Aaqib Hussain on 31/8/18.
//  Copyright © 2018 Aaqib Hussain. All rights reserved.
//

import UIKit
import Toast_Swift

class LoginViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Var
    
    let viewModel = LoginViewModel()
    
    //MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelCallback()
    }
    
    //MARK: Functions
    
    private func setupViewModelCallback() {
        viewModel.loginSuccess = { [weak self] in
            guard let `self` = self else { fatalError("self is nil") }
            
            //Empty fields
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
            //transition to tab bar
            let tabBarController = UITabBarController.instantiateViewController()
            self.present(tabBarController, animated: true)
            
        }
    }
    
    private func areTextFieldsEmpty() -> Bool {
        if userNameTextField.text == "" || passwordTextField.text == "" {
            return true
        } else {
            return false
        }
    }
    
    //MARK: Action
    
    @IBAction func loginAction(_ sender: UIButton) {
        if areTextFieldsEmpty() {
            self.view.makeToast("Textfield cannot be empty", duration: 1, position: .center)
        } else {
            self.view.endEditing(true)
            viewModel.login(userName: userNameTextField.text!, password: passwordTextField.text!)
        }
    }
    
}
